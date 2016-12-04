using Base.Test

include("first.jl")

@test is_valid("aaaaa-bbb-z-y-x-123[abxyz]")
@test is_valid("a-b-c-d-e-f-g-h-987[abcde]")
@test is_valid("not-a-real-room-404[oarel]")
@test !is_valid("totally-real-room-200[decoy]")
