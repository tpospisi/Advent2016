#!/bin/julia

include("first.jl")

fname = "input.txt"

println(solve(readlines(fname)))
