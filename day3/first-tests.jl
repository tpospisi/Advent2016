using Base.Test

include("first.jl")

@test count_triangles([(5, 10, 25)]) == 0
