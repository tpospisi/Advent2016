function ceaser_shift(string, shift)
    return map(x -> Char(mod(x - 'a' + shift, 26) + 'a'), string)
end

function solve(fname)
    for line in readlines(fname)
        left, check = split(line, "[")
        chars_and_sector = split(left, "-")
        sector = parse(Int, chars_and_sector[end])
        string = join(chars_and_sector[1:end-1])

        if ceaser_shift(string, sector) == "northpoleobjectstorage"
            return sector
        end
    end

    error("northpoleobjectstorage not found")
end
