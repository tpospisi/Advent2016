#!/bin/julia

include("first.jl")

fname = "input.txt"

M = readdlm(fname, Int)
triplets = (M[ii, :] for ii in 1:size(M, 1))

println(count_triangles(triplets))
