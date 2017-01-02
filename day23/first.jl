function solve(lines)
    registers = Dict{String, Int}()

    function value(x)
        if haskey(registers, x)
            return registers[x]
        else
            return parse(Int, x)
        end
    end

    for name in ["a", "b", "c", "d"]
        registers[name] = 0
    end

    registers["a"] = 7

    idx = 1

    while idx <= length(lines)
        line = lines[idx]
        parts = split(line, " ")
        if parts[1] == "cpy"
            x = parts[2]
            y = parts[3]
            if haskey(registers, String(y))
                registers[y] = value(x)
            end
        elseif parts[1] == "tgl"
            x = parts[2]
            tgl_idx = idx + value(x)
            if 1 <= tgl_idx <= length(lines)
                tgl_parts = split(lines[tgl_idx], " ")
                if length(tgl_parts) == 2
                    if tgl_parts[1] == "inc"
                        tgl_parts[1] = "dec"
                    else
                        tgl_parts[1] = "inc"
                    end
                else
                    if tgl_parts[1] == "jnz"
                        tgl_parts[1] = "cpy"
                    else
                        tgl_parts[1] = "jnz"
                    end
                end
                lines[tgl_idx] = join(tgl_parts, " ")
            end
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
