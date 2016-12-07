function repeats(string)
    oldest = '?'
    older = '?'
    old = '?'
    for char in string
        if char == oldest && old == older && char != older
            return true
        end
        oldest, older, old = older, old, char
    end
    return false
end

function supports_tls(ip)
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

    return any(map(repeats, supernets)) &&
           !any(map(repeats, hypernets))
end

function solve(ips)
    return sum(supports_tls(ip) for ip in ips)
end
