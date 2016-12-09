using Base.Test

include("first.jl")

@test solve("ADVENT") == 6
@test solve("A(1x5)BC") == 7
@test solve("(3x3)XYZ") == 9
@test solve("A(2x2)BCD(2x2)EFG") == 11
@test solve("(6x1)(1x3)A") == 6
@test solve("X(8x2)(3x3)ABCY") == 18
