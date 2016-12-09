using Base.Test

include("first.jl")

screen = falses(3, 7)

@test move!(screen, "rect 3x2") == [true  true  true  false false false false;
                                   true  true  true  false false false false;
                                   false false false false false false false]

@test move!(screen, "rotate column x=1 by 1") == [true  false true  false false false false;
                                                  true  true  true  false false false false;
                                                  false true  false false false false false]

@test move!(screen, "rotate row y=0 by 4") == [false false false false true  false true;
                                               true  true  true  false false false false;
                                               false true  false false false false false]

@test move!(screen, "rotate column x=1 by 1") == [false true  false false true  false true ;
                                                  true  false true  false false false false;
                                                  false true  false false false false false]
