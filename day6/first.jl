using DataStructures

function solve(lines)
    nchars = length(lines[1])

    answer = Array(Char, nchars)

    for ii in 1:nchars
        chars = map(x -> x[ii], lines)
        counts = counter(chars)

        maxval = 0
        maxchar = '?'

        for (key, val) in counts
            if val > maxval
                maxval = val
                maxchar = key
            end
        end

        answer[ii] = maxchar
    end

    return join(answer)
end
