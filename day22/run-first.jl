#!/bin/julia

include("first.jl")

fname = "input.txt"

lines = [chomp(xx) for xx in readlines(fname)][3:end]

println(solve(lines))
