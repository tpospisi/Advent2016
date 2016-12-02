#!/bin/julia

include("first.jl")

fname = "input.txt"

sequences = readlines(fname)
map!(chomp, sequences)

println(solve(sequences))
