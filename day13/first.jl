using DataStructures

function solve(input, target)
    seen = Set()

    function is_open(x, y)
        return sum(digits(x*x + 3*x + 2*x*y + y + y*y + input, 2)) % 2 == 0
    end

    queue = Queue(Tuple{Int, Int, Int})

    enqueue!(queue, (1, 1, 0))
    push!(seen, (1, 1))

    while !isempty(queue)
        x, y, move = dequeue!(queue)

        if (x, y) == target
            return move
        end

        for xoff = -1:1, yoff = -1:1
            if abs(xoff) + abs(yoff) == 1 && (x + xoff >= 0) && (y + yoff >= 0)
                xnew = x + xoff
                ynew = y + yoff
                if is_open(xnew, ynew) && !((xnew, ynew) in seen)
                    enqueue!(queue, (xnew, ynew, move + 1))
                    push!(seen, (xnew, ynew))
                end
            end
        end
    end

    error("Cannot reach the target")
end
