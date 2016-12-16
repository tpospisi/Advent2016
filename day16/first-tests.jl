using Base.Test

include("first.jl")

@test solve("110010110100", 12) == "100"
@test solve("10000", 20) == "01100"
