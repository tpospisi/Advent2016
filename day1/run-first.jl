#!/bin/julia

include("first.jl")

fname = "input.txt"

line = readstring(fname)
moves = split(chomp(line), ", ")

println(make_moves(moves))
