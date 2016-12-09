#!/bin/julia

include("second.jl")

fname = "input.txt"

println(solve(chomp(readstring(fname))))
