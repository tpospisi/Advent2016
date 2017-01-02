using Base.Test

include("second.jl")

@test solve(["5-8", "0-2", "4-7"], 9) == 2
