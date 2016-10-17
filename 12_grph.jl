# Rosalind problem 12 Overlap Graphs
# Match the suffix and prefix of dna strings of length 3

include("scripts/fasta.jl")
using fasta

function check_strings(dnaStrings, numMatch)
    for i in dnaStrings
        str1Name= i[1]
        str1 = i[2]
        for j in dnaStrings
            str2Name= j[1]
            str2 = j[2]
            if is_overlapped(str1, str2, numMatch) && str1 != str2
                println(str1Name," ", str2Name)
            end
        end
    end
end

function is_overlapped(str1, str2, k)
    return str1[end-k+1:end] == str2[1:k]
end

open("data/rosalind_grph.txt", "r") do f
    numMatch = 3
    dnaStrings = parse_fasta(f)
    check_strings(dnaStrings, numMatch)
end 
