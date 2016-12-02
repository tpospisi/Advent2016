using Base.Test

include("first.jl")

@test solve(["ULL", "RRDDD", "LURDL", "UUUUD"]) == "1985"
