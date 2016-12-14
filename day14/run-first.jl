#!/bin/julia

include("first.jl")

salt = "ihaygndm"

println(solve(salt, 64))
