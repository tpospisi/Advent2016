using Base.Test

include("second.jl")

lines = ["eedadn",
         "drvtee",
         "eandsr",
         "raavrd",
         "atevrs",
         "tsrnev",
         "sdttsa",
         "rasrtv",
         "nssdts",
         "ntnada",
         "svetve",
         "tesnvt",
         "vntsnd",
         "vrdear",
         "dvrsen",
         "enarar"]

@test solve(lines) == "advent"
