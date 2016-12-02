#!/bin/julia

include("second.jl")

fname = "input.txt"

sequences = readlines(fname)
map!(chomp, sequences)

println(solve(sequences))
