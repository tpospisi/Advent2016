function solve(n)
    ii = 1
    for z = 1:n
        if ii >= (z - 1)
            ii = 1
        else
            ii += 2
        end
    end
    return ii
end
