function solve(periods, starts)
    N = prod(periods)
    time = 0
    for ii in 1:length(periods)
        M = div(N, periods[ii])
        time += -(starts[ii] + ii) * invmod(M, periods[ii]) * M
    end
    return (N + (time % N)) % N
end
