using Nettle
using DataStructures

function next_moves(pass, x, y, moves)
    hex = hexdigest("md5", "$pass$moves")

    ret = []

    for (id, dir, xoff, yoff) in ((1, "U", 0, -1),
                                  (2, "D", 0, 1),
                                  (3, "L", -1, 0),
                                  (4, "R", 1, 0))
        if 1 <= x + xoff <= 4 && 1 <= y + yoff <= 4 && hex[id] in 'b':'f'
            push!(ret, (x + xoff, y + yoff, moves * dir))
        end
    end

    return ret
end

function solve(pass)
    len = 0
    queue = Queue(Any)

    enqueue!(queue, (1, 1, ""))

    while !isempty(queue)
        x, y, moves = dequeue!(queue)

        if x == 4 && y == 4
            return moves
        end

        for move in next_moves(pass, x, y, moves)
            enqueue!(queue, move)
        end
    end

    return len
end
