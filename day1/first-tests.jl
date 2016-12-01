using Base.Test

include("first.jl")

@test make_moves(["R2", "L3"]) == 5
@test make_moves(["R2", "R2", "R2"]) == 2
@test make_moves(["R5", "L5", "R5", "R3"]) == 12
