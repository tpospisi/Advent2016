#!/bin/julia

include("first.jl")

fname = "input.txt"

lines = [chomp(xx) for xx in readlines("input.txt")]

println(solve(lines, "abcdefgh"))
