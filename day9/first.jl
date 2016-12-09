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
            nchar, times = [parse(Int, num) for num in split(marker, 'x')]
            len_string += nchar * (times - 1)
            len_string -= second - cursor + 1
            cursor = second + nchar
        end
        cursor += 1
    end

    return len_string
end
