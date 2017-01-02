#!/bin/julia

include("first.jl")

fname = "input.txt"

lines = chomp.(readlines(fname))

println(solve(lines))
