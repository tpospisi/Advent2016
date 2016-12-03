#!/bin/julia

include("first.jl")

fname = "input.txt"

mat = readdlm(fname, Int)
triplets = (mat[ii, :] for ii in 1:size(M, 1))

println(count_triangles(triplets))
