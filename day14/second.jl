# lines = [line for line in readlines("input.txt")]

using Nettle

function bighash(str)
    for ii = 1:2017
        str = hexdigest("md5", "$str")
    end
    return str
end

function solve(salt, num_keys)
    look_ahead = 1000

    hashes = [bighash("$salt$ii") for ii = 1:(look_ahead + 1)]

    idx = 0
    while num_keys > 0
        idx += 1
        hash = hashes[mod1(idx, look_ahead)]
        hashes[mod1(idx, look_ahead)] = bighash("$salt$(idx + look_ahead)")
        m = match(r"(.)\1\1", hash)
        if m != nothing
            char = m[1]
            for hash in hashes
                others = [x[1:1] for x in matchall(r"(.)\1\1\1\1", hash)]
                if any(others .== char)
                    num_keys -= 1
                    break
                end
            end
        end
    end
    return idx
end
