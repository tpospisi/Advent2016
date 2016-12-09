function move!(screen, line)
    nrow, ncol = size(screen)

    parts = split(line, ' ')
    if parts[1] == "rect"
        left, right = split(parts[2], "x")
        row = parse(Int, left)
        col = parse(Int, right)

        screen[1:col, 1:row] = true
    elseif parts[2] == "row"
        row = parse(Int, parts[3][3:end]) + 1
        by = parse(Int, parts[5])
        screen[row, :] = screen[row, mod1.((1:ncol) - by, ncol)]
    else
        col = parse(Int, parts[3][3:end]) + 1
        by = parse(Int, parts[5])

        screen[:, col] = screen[mod1.((1:nrow) - by, nrow), col]
    end

    return screen
end

function solve(lines)
    nrow = 6
    ncol = 50

    screen = falses(nrow, ncol)

    for line in lines
        move!(screen, line)
    end

    for jj = 1:nrow
        for ii = 1:ncol
            print(screen[jj, ii] ? 'X' : ' ')
        end
        print("\n")
    end
end
