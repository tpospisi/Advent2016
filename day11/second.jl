using DataStructures

function swap(vec, ids, vals)
    tmp = copy(vec)

    for (idx, val) in zip(ids, vals)
        tmp[idx] = val
    end

    return tmp
end

function solve(start_rtgs, start_chips, nFloors)
    nChips = length(start_rtgs)

    queue = Queue(Tuple{Int, Vector{Int}, Vector{Int}, Int})
    seen = Set{Tuple{Int, Vector{Tuple{Int, Int}}}}()

    function add!(queue, floor, rtgs, chips, nMoves)
        ## Stay on feasible floor
        !(1 <= floor <= nFloors) && return

        ## Avoid irradiated chips
        for idx in 1:nChips
            chips[idx] != rtgs[idx] && any(rtgs .== chips[idx]) && return
        end

        ## Avoid symmetries
        pairs = sort([pair for pair in zip(rtgs, chips)])
        (floor, pairs) in seen && return

        enqueue!(queue, (floor, rtgs, chips, nMoves))
        push!(seen, (floor, pairs))
    end

    add!(queue, 1, start_rtgs, start_chips, 0)
    while !isempty(queue)
        floor, rtgs, chips, nMoves = dequeue!(queue)

        ## Found solution
        if floor == nFloors && all(rtgs .== nFloors) && all(chips .== nFloors)
            return nMoves
        end

        ## Make a new move
        for move in [-1, 1]
            1 <= floor + move <= nFloors || continue
            for idx in 1:nChips
                if rtgs[idx] == floor
                    add!(queue, floor + move, swap(rtgs, idx, floor + move),
                         copy(chips), nMoves + 1)
                end
                if chips[idx] == floor
                    add!(queue, floor + move, copy(rtgs),
                         swap(chips, idx, floor + move), nMoves + 1)
                end
                if rtgs[idx] == floor && chips[idx] == floor
                    add!(queue, floor + move, swap(rtgs, idx, floor + move),
                         swap(chips, idx, floor + move), nMoves + 1)
                end
            end
            for low_idx in 1:(nChips-1), high_idx in (low_idx+1):nChips
                ids = [low_idx, high_idx]
                floors = [floor + move, floor + move]
                if rtgs[low_idx] == floor && rtgs[high_idx] == floor
                    add!(queue, floor + move, swap(rtgs, ids, floors),
                         copy(chips), nMoves + 1)
                end
                if chips[low_idx] == floor && chips[high_idx] == floor
                    add!(queue, floor + move, copy(rtgs),
                         swap(chips, ids, floors), nMoves + 1)
                end
            end
        end
    end

    error("Solution is not possible")
end
