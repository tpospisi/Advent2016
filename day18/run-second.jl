#!/bin/julia

include("second.jl")

fname = "input.txt"

input = chomp(readline(fname))

println(solve(input))
