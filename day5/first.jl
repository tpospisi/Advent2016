using Nettle

function solve(input)
    answer_length = 8
    num_zeros = 5

    answer = Array(Char, answer_length)

    num = 0
    for ii = 1:answer_length
        found = false
        while !found
            num += 1
            hex = hexdigest("md5", "$input$num")
            if hex[1:num_zeros] == "0" ^ num_zeros
                answer[ii] = hex[num_zeros + 1]
                found = true
            end
        end
    end

    return join(answer)
end
