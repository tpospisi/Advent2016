function solve(n)
    ii = 0
    for z = 0:n
        if ii >= z
            ii = 1
        elseif ii >= div(z, 2)
            ii += 2
            ii %= z
        else
            ii += 1
        end
    end
    return ii
end
