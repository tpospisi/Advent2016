using Nettle
using DataStructures

immutable State
    x::Int
    y::Int
    history::String
end

const move_set = ((1, "U", 0, -1), (2, "D", 0, 1),
                  (3, "L", -1, 0), (4, "R", 1, 0))

function next_moves(pass, current)
    hex = hexdigest("md5", pass * current.history)

    ret = State[]

    for (id, dir, xoff, yoff) in move_set
        xnew = current.x + xoff
        ynew = current.y + yoff
        if 1 <= xnew <= 4 && 1 <= ynew <= 4 && in(hex[id], 'b':'f')
            push!(ret, State(xnew, ynew, current.history * dir))
        end
    end

    return ret
end

function solve(pass)
    stack = Stack(State)
    push!(stack, State(1, 1, ""))

    len = 0
    while !isempty(stack)
        current = pop!(stack)

        if current.x == 4 && current.y == 4
            len = max(len, length(current.history))
            continue
        end

        for move in next_moves(pass, current)
            push!(stack, move)
        end
    end

    return len
end
