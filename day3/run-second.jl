#!/bin/julia

include("second.jl")

fname = "input.txt"

M = readdlm(fname, Int)
triplets = (M[ii:(ii+2), jj] for ii in 1:3:size(M, 1), jj in 1:size(M, 2))

println(count_triangles(triplets))
