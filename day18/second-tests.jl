using Base.Test

include("second.jl")

@test solve(".^^.^.^^^^", 10) == 38
