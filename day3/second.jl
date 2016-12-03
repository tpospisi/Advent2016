function count_triangles(triplets)
    count = 0
    for (a, b, c) in triplets
        if (a + b > c) && (a + c > b) && (b + c > a)
            count += 1
        end
    end
    return count
end
