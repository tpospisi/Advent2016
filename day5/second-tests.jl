using Base.Test

include("second.jl")

@test solve("abc") == "05ace8e3"
