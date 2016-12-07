using Base.Test

include("first.jl")

@test supports_tls("abba[mnop]qrst")
@test !supports_tls("abcd[bddb]xyyx")
@test !supports_tls("aaaa[qwer]tyui")
@test supports_tls("ioxxoj[asdfgh]zxcvbn")
