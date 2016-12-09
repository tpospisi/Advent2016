function solve(line)
    cursor = 1
    len_string = length(line)

    while cursor <= length(line)
        if line[cursor] == '('
            second = cursor + 1
            while line[second] != ')'
                second += 1
            end
            marker = line[(cursor + 1):(second - 1)]
            nchar, times = [parse(Int, xx) for xx in split(marker, 'x')]
            substring = line[(second + 1):(second + nchar)]
            len_string += times * solve(substring)
            len_string -= second + nchar - cursor + 1
            cursor = second + nchar
        end
        cursor += 1
    end

    return len_string
end
