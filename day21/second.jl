using Combinatorics

function solve(lines, endresult)
    n = length(endresult)
    for seed in permutations('a':'h')
        pass = copy(seed)

        for line in lines
            parts = split(line)
            if parts[1] == "swap" && parts[2] == "position"
                x = parse(Int, parts[3]) + 1
                y = parse(Int, parts[6]) + 1

                pass[x], pass[y] = pass[y], pass[x]
            elseif parts[1] == "swap" && parts[2] == "letter"
                x = parts[3][1]
                y = parts[6][1]
                pass[pass .== x] = '?'
                pass[pass .== y] = x
                pass[pass .== '?'] = y
            elseif parts[1] == "reverse"
                x = parse(Int, parts[3]) + 1
                y = parse(Int, parts[5]) + 1

                pass[x:y] = pass[y:-1:x]
            elseif parts[1] == "rotate" && parts[2] == "left"
                x = parse(Int, parts[3])
                pass = pass[mod1.((1:n) + x, n)]
            elseif parts[1] == "rotate" && parts[2] == "right"
                x = parse(Int, parts[3])
                pass = pass[mod1.((1:n) - x, n)]
            elseif parts[1] == "rotate" && parts[2] == "based"
                x = parts[7]
                idx = findfirst(pass .== x[1]) - 1

                rot = 1 + idx
                if idx >= 4
                    rot += 1
                end

                pass = pass[mod1.((1:n) - rot, n)]
            elseif parts[1] == "move"
                x = parse(Int, parts[3]) + 1
                y = parse(Int, parts[6]) + 1

                zz = splice!(pass, x:x)
                splice!(pass, y:(y-1), zz)
            end
        end

        if join(pass) == endresult
            return join(seed)
        end
    end
end
