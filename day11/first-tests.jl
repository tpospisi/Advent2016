using Base.Test

include("first.jl")

@test solve([2, 3], [1, 1], 4) == 11
