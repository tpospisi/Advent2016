using DataStructures

function solve(lines)
    chips = DefaultDict(Int, Vector{Int}, () -> Int[])
    executed = falses(length(lines))

    while !all(executed)
        for (ix, line) in enumerate(lines)
            !executed[ix] || continue
            parts = split(line, ' ')
            if parts[1] == "value"
                value = parse(Int, parts[2])
                bot = parse(Int, parts[6])

                length(chips[bot]) <= 2 || continue
                push!(chips[bot], value)
            else
                giver = parse(Int, parts[2])
                low_getter = parse(Int, parts[7])
                high_getter = parse(Int, parts[12])

                length(chips[giver]) == 2 || continue
                low, high = sort(chips[giver])

                length(chips[low_getter]) < 2 || continue
                length(chips[high_getter]) < 2 || continue

                push!(chips[low_getter], low)
                push!(chips[high_getter], high)
                chips[giver] = []
            end
            executed[ix] = true
        end
    end

    return prod(prod(chips[ii]) for ii in 0:2)
end
