function solve(lines)
    useds = []
    avails = []

    for line in lines
        name, size, used, avail, perc = split(line)

        used = parse(Int, used[1:(end-1)])
        avail = parse(Int, avail[1:(end-1)])

        push!(useds, used)
        push!(avails, avail)
    end

    tot = 0

    for ii in 1:length(useds), jj in 1:length(useds)
        if ii != jj
            if (useds[ii] > 0) && (useds[ii] <= avails[jj])
                tot += 1
            end
        end
    end

    return tot
end
