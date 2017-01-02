using Base.Test

include("first.jl")

lines = ["###########",
         "#0.1.....2#",
         "#.#######.#",
         "#4.......3#",
         "###########"]

@test solve(lines) == 14
