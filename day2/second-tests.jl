using Base.Test

include("second.jl")

@test solve(["ULL", "RRDDD", "LURDL", "UUUUD"]) == "5DB3"
