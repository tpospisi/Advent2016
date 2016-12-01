#!/bin/julia

include("second.jl")

fname = "input.txt"

line = readstring(fname)
moves = split(chomp(line), ", ")

println(make_moves(moves))
