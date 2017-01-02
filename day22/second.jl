using Base.Collections

function solve(lines)
    tmp_sizes = Dict()
    tmp_useds = Dict()

    max_x = 0
    max_y = 0

    for line in lines
        mm = match(r"/dev/grid/node-x(?<x>\d+)-y(?<y>\d+)\s+(?<size>\d+)T\s+(?<used>\d+)T\s+(?<available>\d+)T\s+(\d+)%", line)
        x = parse(Int, mm[:x]) + 1
        y = parse(Int, mm[:y]) + 1

        used = parse(Int, mm[:used])
        available = parse(Int, mm[:available])

        size = used + available

        tmp_sizes[x, y] = size
        tmp_useds[x, y] = used

        max_x = max(x, max_x)
        max_y = max(y, max_y)
    end

    useds = zeros(Int, max_x, max_y)
    for ((x, y), val) in tmp_useds
        useds[x, y] = val
    end

    sizes = zeros(Int, max_x, max_y)
    for ((x, y), val) in tmp_sizes
        sizes[x, y] = val
    end

    special_x = max_x
    special_y = 1

    queue = PriorityQueue(Tuple{Vector{Tuple{Tuple{Int, Int}, Tuple{Int, Int}}}, Int, Int}, Int)
    seen = Set()
    enqueue!(queue, (Tuple{Tuple{Int, Int}, Tuple{Int, Int}}[], special_x, special_y), max_x)

    while !isempty(queue)
        (moves, special_x, special_y), score = peek(queue)
        dequeue!(queue)

        if (special_x, special_y) == (1, 1)
            return length(moves)
        end

        tmp_useds = copy(useds)

        for ((x, y), (tx, ty)) in moves
            tmp_useds[tx, ty] += tmp_useds[x, y]
            tmp_useds[x, y] = 0
        end

        for x in 1:max_x, y in 1:max_y
            if tmp_useds[x, y] > 0
                for (xt, yt) in [(x - 1, y), (x + 1 , y), (x, y - 1), (x, y + 1)]
                    if checkbounds(Bool, tmp_useds, xt , yt ) &&
                        ((tmp_useds[x , y ] + tmp_useds[xt , yt ]) <= sizes[xt , yt ])

                        if (x, y) == (special_x, special_y)
                            sx, sy = xt, yt
                        else
                            sx, sy = special_x, special_y
                        end

                        new_useds = copy(tmp_useds)
                        new_useds[xt , yt ] += new_useds[x , y ]
                        new_useds[x , y ] = 0

                        zx, zy = ind2sub(size(new_useds), find(new_useds .== 0))

                        if !in((zx, zy, sx, sy), seen)
                            enqueue!(queue, ([moves; ((x, y), (xt, yt))], sx, sy), length(moves) + sx + sy - 1)
                            push!(seen, (zx, zy, sx, sy))
                        end
                    end
                end
            end
        end
    end
    error("Solution not found")
end
