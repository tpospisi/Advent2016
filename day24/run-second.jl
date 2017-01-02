#!/bin/julia

include("second.jl")

fname = "input.txt"

lines = chomp.(readlines(fname))

println(solve(lines))
