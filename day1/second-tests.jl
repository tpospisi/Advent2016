using Base.Test

include("second.jl")

@test make_moves(["R8", "R4", "R4", "R8"]) == 4
