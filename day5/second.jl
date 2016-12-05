using Nettle

function solve(input)
    answer_length = 8
    num_zeros = 5
    index_chars = '0':('0' + answer_length - 1)

    answer = Array(Char, answer_length)
    dones = falses(answer_length)

    num = 0
    while !all(dones)
        num += 1
        hex = hexdigest("md5", "$input$num")
        if hex[1:num_zeros] == "0" ^ num_zeros
            index_char = hex[num_zeros + 1]
            if index_char in index_chars
                index = parse(Int, index_char) + 1
                if !dones[index]
                    answer[index] = hex[num_zeros + 2]
                    dones[index] = true
                end
            end
        end
    end

    return join(answer)
end
