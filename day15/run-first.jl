#!/bin/julia

include("first.jl")

fname = "input.txt"

lines = [xx for xx in readlines(fname)]

pattern = r"Disc #\d* has (\d*) positions; at time=0, it is at position (\d*)"

lengths = [parse(Int, match(pattern, line)[1]) for line in lines]
starts = [parse(Int, match(pattern, line)[2]) for line in lines]

println(solve(lengths, starts))
