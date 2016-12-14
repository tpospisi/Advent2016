using Nettle

function solve(salt, num_keys)
    look_ahead = 1000

    hashes = [hexdigest("md5", "$salt$ii") for ii = 1:(look_ahead + 1)]

    idx = 0
    while num_keys > 0
        idx += 1
        hash = hashes[mod1(idx, look_ahead)]
        hashes[mod1(idx, look_ahead)] = hexdigest("md5", "$salt$(idx + look_ahead)")
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
