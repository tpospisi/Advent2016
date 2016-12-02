function solve(sequences)
    field = [[' ', ' ', ' ', ' ', ' '],
             [' ', '1', '2', '3', ' '],
             [' ', '4', '5', '6', ' '],
             [' ', '7', '8', '9', ' '],
             [' ', ' ', ' ', ' ', ' ']]

    move = Dict()

    offsets = [('L', -1, 0), ('R', 1, 0), ('U', 0, -1), ('D', 0, 1)]

    for row = 2:4
        for col = 2:4
        elem = field[row][col]
            for (char, coloff, rowoff) in offsets
                to = field[row + rowoff][col + coloff]
                move[elem, char] = to == ' ' ? elem : to
            end
        end
    end

    position = '5'
    solution = []

    for seq in sequences
        for char in seq
            position = move[position, char]
        end
        push!(solution, position)
    end

    return join(solution)
end
