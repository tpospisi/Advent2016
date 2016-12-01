function make_moves(moves)
    location = 0 + 0im
    orientation = 1 + 0im

    for move in moves
        rotate = move[1]
        spaces = parse(Int, move[2:end])

        orientation *= (rotate == 'R' ? 1 : -1) * im
        location += spaces * orientation
    end

    return(abs(real(location)) + abs(imag(location)))
end
