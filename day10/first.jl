using DataStructures

function solve(lines)
    chips = DefaultDict(Int, Vector{Int}, () -> Int[])
    executed = falses(length(lines))

    while !all(executed)
        for (ix, line) in enumerate(lines)
            if !executed[ix]
                parts = split(line, ' ')
                if parts[1] == "value"
                    value = parse(Int, parts[2])
                    bot = parse(Int, parts[6])

                    length(chips[bot]) <= 2 || continue
                    push!(chips[bot], value)

                    if sort(chips[bot]) == [17, 61]
                        return bot
                    end

                    executed[ix] = true
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

                    for id in [low_getter, high_getter]
                        sort(chips[low_getter]) == [17, 61] && return id
                    end

                    executed[ix] = true
                end
            end
        end
    end

    error("No bot compared 17 and 61")
end
