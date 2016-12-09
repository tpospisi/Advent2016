#!/bin/julia

include("first.jl")

fname = "input.txt"

println(solve(chomp(readstring(fname))))
