using Base.Test

include("first.jl")

@test is_valid("aaaaabbbzyx", "abxyz")
@test is_valid("abcdefgh", "abcde")
@test is_valid("notarealroom", "oarel")
@test !is_valid("totallyrealroom", "decoy")
