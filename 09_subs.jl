

open("data/rosalind_subs.txt", "r") do f
    dna::ASCIIString = strip(readline(f))
    str = strip(readline(f))
    re = Regex(str)

    for i in eachmatch(re, dna, true)
        print(i.offset, " ")
    end
    println()
end
