function solve(lines, N = 4294967295)
    lefts = map(x -> parse(Int, split(x, "-")[1]), lines)
    rights = map(x -> parse(Int, split(x, "-")[2]), lines)

    p = sortperm(lefts)
    lefts = lefts[p]
    rights = rights[p]

    permitted = 0
    idx = 0

    for (left, right) in zip(lefts, rights)
        if left > idx
            permitted += left - idx - 1
        end
        idx = max(idx, right)
    end
    permitted += N - idx

    return permitted
end
