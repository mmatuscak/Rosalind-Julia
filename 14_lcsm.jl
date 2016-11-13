# Rosalind problem 14, Finding a Shared Motif
# Return the longest common substring in a given collection.

include("scripts/fasta.jl")
using fasta

# This function gets the longest common substring between two strings, I don't actually return
# the longest substring, but the longer common substrings.
function LCSubstr(S::String, T::String)
    LCS_cache = Array{UInt32}(length(S), length(T))
    Substrs = Dict{String, UInt32}()
    longest_sz::UInt32 = 0
    maxi::UInt32 = 0

    len_s = length(S)
    len_t = length(T)
    for i = 1:len_s
        for j = 1:len_t
            if i == 1 || j == 1
                LCS_cache[i,j] = 0
            elseif S[i-1] == T[j-1] 
                LCS_cache[i,j] = LCS_cache[i-1,j-1] + 1
                if LCS_cache[i,j] >= longest_sz
                    longest_sz = LCS_cache[i,j]
                    maxi = i
                    longest = S[maxi-longest_sz:maxi-1]
                    Substrs[longest] = length(longest)
                end
            else
                LCS_cache[i,j] = 0
            end
        end
    end
    
    longest = S[maxi-longest_sz:maxi-1]

    return Substrs 
end

function get_substring(dna_fasta)
    dna = Array{String}(length(dna_fasta))
    longest = Array{Dict{String, UInt32}}(length(dna)-1) 
    long::String = ""

    for (i, j) in enumerate(dna_fasta)
        dna[i] = j[2]
    end
    
    # Getting only the substrings in the first two strings are enough because we can then
    # check the subsequent strings with the collection from the first two strings.
    first_seq = LCSubstr(dna[1], dna[2])

    num_check::UInt32 = 0
    max_length::UInt32 = 0

    for (key, value) in first_seq
        num_check = 0
        for i in dna
            # We need to know if the key is in all dna strings
            if contains(i, key)
                num_check += 1
            end
        end

        # Check if the current key is in all dna string and is longer than the current longest
        if num_check == length(dna) && value > max_length
            long = key
            max_length = value
        end
    end

    return long
end

open("data/rosalind_lcsm.txt", "r") do f
    dna_fasta = parse_fasta(f)
    str = get_substring(dna_fasta)
    println(str)
end
