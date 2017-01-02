#!/bin/julia

include("second.jl")

fname = "input.txt"

lines = [chomp(xx) for xx in readlines(fname)][3:end]

println(solve(lines))
