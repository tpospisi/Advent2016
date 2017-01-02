using Base.Test

include("first.jl")

@test solve(5) == 3
