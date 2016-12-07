#!/bin/julia

include("second.jl")

fname = "input.txt"

println(solve(readlines(fname)))
