using Base.Test

include("second.jl")

@test supports_ssl("aba[bab]xyz")
@test !supports_ssl("xyx[xyx]xyx")
@test supports_ssl("aaa[kek]eke")
@test supports_ssl("zazbz[bzb]cdb")
