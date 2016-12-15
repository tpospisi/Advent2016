function solve(lengths, starts)
    ix = lengths[1] - starts[1] - 1
    while true
        ix += lengths[1]

        works = true
        for ii in 1:length(lengths)
            if ((starts[ii] + ix + ii) % lengths[ii]) != 0
                works = false
                break
            end
        end

        if works
            return ix
        end
    end
end
