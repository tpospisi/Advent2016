using Base.Test

include("first.jl")

@test solve(["cpy 41 a", "inc a", "inc a", "dec a","jnz a 2", "dec a"]) == 42
