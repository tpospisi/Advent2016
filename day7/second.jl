function aba_pairs(string)
    pairs = []
    oldest = '?'
    old = '?'
    for char in string
        if char == oldest
            push!(pairs, (char, old))
        end
        oldest, old = old, char
    end
    return pairs
end

function supports_ssl(ip)
    supernets = []
    hypernets = []

    while findfirst(ip, '[') != 0
        left = findfirst(ip, '[')
        right = findfirst(ip, ']')
        push!(supernets, ip[1:(left - 1)])
        push!(hypernets, ip[(left + 1):(right - 1)])
        ip = ip[(right + 1):end]
    end
    push!(supernets, ip)

    pairs = Set()
    for subseq in supernets
        for (left, right) in aba_pairs(subseq)
            push!(pairs, (left, right))
        end
    end

    for subseq in hypernets
        for (left, right) in aba_pairs(subseq)
            if (right, left) in pairs
                return true
            end
        end
    end

    return false
end

function solve(ips)
    return sum(supports_ssl(ip) for ip in ips)
end
