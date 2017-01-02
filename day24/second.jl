using DataStructures
using Combinatorics
function solve(lines)
    nrow = length(lines)
    ncol = length(lines[1])

    avail = falses(nrow, ncol)

    required = Dict()

    for ii in 1:nrow
        for jj in 1:ncol
            if lines[ii][jj] == '.'
                avail[ii, jj] = true
            elseif !in(lines[ii][jj], ['#', ' '])
                avail[ii, jj] = true
                required[lines[ii][jj]] = (ii, jj)
            end
        end
    end

    function solve(start, finish)
        queue = Queue(Any)

        enqueue!(queue, [start])
        seen = Set()

        while !isempty(queue)
            moves = dequeue!(queue)

            if moves[end] == finish
                return length(moves)
            end

            x, y = moves[end]

            for (xnew, ynew) in [(x - 1, y),
                                 (x + 1, y),
                                 (x, y - 1),
                             (x, y + 1)]
                if checkbounds(Bool, avail, xnew, ynew) && avail[xnew, ynew]
                    if !in((xnew, ynew), seen)
                        enqueue!(queue, [moves; (xnew, ynew)])
                        push!(seen, (xnew, ynew))
                    end
                end
            end
        end
    end

    nodes = sort(collect(keys(required)))

    n = length(nodes)

    dists = zeros(Int, n, n)

    for aa in 1:n, bb in (aa + 1):n
        dists[aa, bb] = solve(required[nodes[aa]], required[nodes[bb]]) - 1
    end

    tot = Inf

    for p in permutations(collect(2:n))
        zz = 0
        np = [1; p; 1]
        for ii = 1:n
            jj = ii + 1

            zz += dists[np[ii], np[jj]]
            zz += dists[np[jj], np[ii]]
        end

        if zz < tot
            tot = zz
        end
    end

    return tot
end
