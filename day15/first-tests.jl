using Base.Test

include("first.jl")

@test solve([5, 2], [4, 1]) == 5
