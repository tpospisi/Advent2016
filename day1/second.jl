function make_moves(moves)
    locations = Set{Complex{Int}}(0 + 0im)

    location = 0 + 0im
    orientation = 1 + 0im

    for move in moves
        rotate = move[1]
        spaces = parse(Int, move[2:end])

        orientation *= (rotate == 'R' ? 1 : -1) * im

        for _ in 1:spaces
            location += orientation

            if location in locations
                return(abs(real(location)) + abs(imag(location)))
            else
                push!(locations, location)
            end
        end
    end

    error("No location visited twice")
end
