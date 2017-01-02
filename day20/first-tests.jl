using Base.Test

include("first.jl")

@test solve(["5-8", "0-2", "4-7"]) == 3
