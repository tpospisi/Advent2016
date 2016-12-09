using Base.Test

include("second.jl")

@test solve("(3x3)XYZ") == 9
@test solve("X(8x2)(3x3)ABCY") == 20
@test solve("(27x12)(20x12)(13x14)(7x10)(1x12)A") == 241920
@test solve("(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN") == 445
