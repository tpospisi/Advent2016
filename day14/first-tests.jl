using Base.Test

include("first.jl")

@test solve("abc", 64) == 22728
