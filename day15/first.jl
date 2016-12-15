function solve(lengths, starts)
    ix = 0
    while true
        ix += 1

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
