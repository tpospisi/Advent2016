using Base.Test

include("first.jl")

@test solve(10, (7, 4)) == 11
