using Base.Test

include("second.jl")

M = [101 301 501;
     102 302 502;
     103 303 503;
     201 401 601;
     202 402 602;
     203 403 603]

triplets = (M[ii:(ii+2), jj] for ii in 1:3:size(M, 1), jj in 1:size(M, 2))
@test count_triangles(triplets) == 6
