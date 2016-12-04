using DataStructures

function klargest(n::Int, v::DataStructures.Accumulator{Char, Int64})
    v_keys = collect(keys(v))
    v_vals = collect(values(v))

    p_keys = sortperm(v_keys)
    p_vals = sortperm(v_vals[p_keys], rev = true)

    return Dict(v_keys[p_keys][idx] => v_vals[p_keys][idx] for idx in p_vals[1:n])
end

function is_valid(line)
    left, check = split(line, "[")
    chars_and_sector = split(left, "-")
    sector = parse(Int, chars_and_sector[end])
    string = join(chars_and_sector[1:end-1])

    counts = counter([char for char in string])

    return Set(keys(klargest(5, counts))) == Set(check[1:5])
end


function solve(fname)
    tot = 0

    for line in readlines(fname)
        if is_valid(chomp(line))
            tot += sector
        end
    end

    return tot
end
