#!/bin/julia

include("second.jl")

fname = "input.txt"

lines = [chomp(xx) for xx in readlines(fname)]

println(solve(lines))
