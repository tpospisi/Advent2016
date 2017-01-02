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

function solve(input, N = 400000)
    row = [xx == '.' for xx in input]

    seen = Dict{Vector{Bool}, Int}()
    tot = Dict{Int, Int}()

    seen[row] = 1
    tot[1] = sum(row)

    for ii = 2:N
        row = nextrow(row)
        tot[ii] = tot[ii - 1] + sum(row)
        if haskey(seen, row)
            last = seen[row]
            full, left = divrem(N - ii, row - last_ii)
            return full * (tot[ii] - tot[last]) + (tot[last + left] - tot[last])
        else
            seen[row] = ii
        end
    end
    return tot[N]
end
