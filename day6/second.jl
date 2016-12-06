using DataStructures

function solve(lines)
    nchars = length(lines[1])

    answer = Array(Char, nchars)

    for ii in 1:nchars
        chars = map(x -> x[ii], lines)
        counts = counter(chars)

        minval = typemax(Int)
        minchar = '?'

        for (key, val) in counts
            if val < minval
                minval = val
                minchar = key
            end
        end

        answer[ii] = minchar
    end

    return join(answer)
end
