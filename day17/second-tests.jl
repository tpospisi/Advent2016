using Base.Test

include("second.jl")

@test solve("ihgpwlah") == 370
@test solve("kglvqrro") == 492
@test solve("ulqzkmiv") == 830
