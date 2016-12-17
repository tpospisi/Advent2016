using Base.Test

include("first.jl")

@test solve("ihgpwlah") == "DDRRRD"
@test solve("kglvqrro") == "DDUDRLRRUDRD"
@test solve("ulqzkmiv") == "DRURDRUDDLLDLUURRDULRLDUUDDDRR"
