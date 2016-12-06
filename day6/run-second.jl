#!/bin/julia

include("second.jl")

fname = "input.txt"

lines = [chomp(line) for line in readlines(fname)]

println(solve(lines))
