#!/bin/julia

include("first.jl")

fname = "input.txt"

println(solve([chomp(line) for line in readlines(fname)]))
