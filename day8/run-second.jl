#!/bin/julia

include("second.jl")

fname = "input.txt"

solve([chomp(line) for line in readlines(fname)])
