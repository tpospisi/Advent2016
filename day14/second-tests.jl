using Base.Test

include("second.jl")

@test solve("abc", 64) == 22551
