#!/bin/julia

include("first.jl")

fname = "input.txt"

lines = [chomp(line) for line in readlines(fname)]

println(solve(lines))
