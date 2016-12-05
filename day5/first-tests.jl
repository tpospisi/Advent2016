using Base.Test

include("first.jl")

@test solve("abc") == "18f47a30"
