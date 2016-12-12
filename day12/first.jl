function solve(lines)
    registers = Dict{String, Int}()

    function value(x)
        if haskey(registers, x)
            return registers[x]
        else
            return parse(Int, x)
        end
    end

    for ii in 'a':'d'
        registers[string(ii)] = 0
    end

    idx = 1

    while idx <= length(lines)
        line = lines[idx]
        parts = split(line, " ")
        if parts[1] == "cpy"
            x = parts[2]
            y = parts[3]
            registers[y] = value(x)
        elseif parts[1] == "inc"
            x = parts[2]
            registers[x] += 1
        elseif parts[1] == "dec"
            x = parts[2]
            registers[x] -= 1
        elseif parts[1] == "jnz"
            x = parts[2]
            y = parts[3]
            if value(x) != 0
                idx += value(y) - 1
            end
        end
        idx += 1
    end

    return registers["a"]
end
