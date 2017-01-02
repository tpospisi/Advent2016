function solve(lines)
    lefts = map(x -> parse(Int, split(x, "-")[1]), lines)
    rights = map(x -> parse(Int, split(x, "-")[2]), lines)

    p = sortperm(lefts)
    lefts = lefts[p]
    rights = rights[p]

    idx = 1

    for (left, right) in zip(lefts, rights)
        if idx < left
            return idx
        else
            idx = right + 1
        end
    end

    return idx
end
