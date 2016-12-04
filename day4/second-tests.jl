using Base.Test

include("second.jl")

@test ceaser_shift("qzmtzixmtkozyivhz", 343) == "veryencryptedname"
