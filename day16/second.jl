function solve(key, len)
    arr = [parse(Int, num) for num in key]

    while length(arr) <= len
        a = arr
        b = copy(a)
        b = reverse(b)
        b = 1 - b

        arr = [a; 0; b]
    end

    arr = arr[1:len]

    while length(arr) % 2 == 0
        tmp = []
        for ii in 1:(length(arr) >> 1)
            arr[ii] = (arr[2ii] == arr[2ii - 1]) ? 1 : 0
        end
        arr = arr[1:length(arr) >> 1]
    end

    return join(arr)
end
