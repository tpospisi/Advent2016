#!/bin/julia

include("first.jl")

fname = "input.txt"

input = chomp(readline(fname))

println(solve(input))
