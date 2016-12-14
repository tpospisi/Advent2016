#!/bin/julia

include("second.jl")

salt = "ihaygndm"

println(solve(salt, 64))
