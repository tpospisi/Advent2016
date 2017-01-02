using Base.Test

include("second.jl")

@test solve(5) == 2
