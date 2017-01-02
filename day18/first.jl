function nextrow(row)
    n = length(row)
    padded_row = [true; row; true]

    trap_patterns = ([false, false, true], [true, false, false],
                     [false, true, true], [true, true, false])

    return map(1:n) do ii
        prev = padded_row[ii + (0:2)]
        return !in(prev, trap_patterns)
    end
end

function solve(input, N = 40)
    row = [xx == '.' for xx in input]
    tot = sum(row)
    for ii = 2:N
        row = nextrow(row)
        tot += sum(row)
    end
    return tot
end
