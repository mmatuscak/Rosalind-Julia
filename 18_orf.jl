# Rosalind problem 18, Open Reading Frames 
# Input: a DNA string of at most 1kpb.
# Output(s): All possible distinct proteins.

include("scripts/fasta.jl")
using fasta
using Match

codons = Dict([("TTT", "F"), ("TTC", "F"), ("TTA", "L"), ("TTG", "L"),
               ("TCT", "S"), ("TCC", "S"), ("TCA", "S"), ("TCG", "S"),
               ("TAT", "Y"), ("TAC", "Y"), ("TAA", "@"), ("TAG", "@"),
               ("TGT", "C"), ("TGC", "C"), ("TGA", "@"), ("TGG", "W"),
               ("CTT", "L"), ("CTC", "L"), ("CTA", "L"), ("CTG", "L"),
               ("CCT", "P"), ("CCC", "P"), ("CCA", "P"), ("CCG", "P"),
               ("CAT", "H"), ("CAC", "H"), ("CAA", "Q"), ("CAG", "Q"),
               ("CGT", "R"), ("CGC", "R"), ("CGA", "R"), ("CGG", "R"),
               ("ATT", "I"), ("ATC", "I"), ("ATA", "I"), ("ATG", "M"),
               ("ACT", "T"), ("ACC", "T"), ("ACA", "T"), ("ACG", "T"),
               ("AAT", "N"), ("AAC", "N"), ("AAA", "K"), ("AAG", "K"),
               ("AGT", "S"), ("AGC", "S"), ("AGA", "R"), ("AGG", "R"),
               ("GTT", "V"), ("GTC", "V"), ("GTA", "V"), ("GTG", "V"),
               ("GCT", "A"), ("GCC", "A"), ("GCA", "A"), ("GCG", "A"),
               ("GAT", "D"), ("GAC", "D"), ("GAA", "E"), ("GAG", "E"),
               ("GGT", "G"), ("GGC", "G"), ("GGA", "G"), ("GGG", "G")])

function stop_codons(dna)
    return dna != "TAA" && dna != "TGA" && dna != "TAG"
end

function rev_comp(dna)
    complement = ""

    for base in dna
        @match base begin
            'A' => complement = join([complement, 'T'])
            'T' => complement = join([complement, 'A'])
            'G' => complement = join([complement, 'C'])
            'C' => complement = join([complement, 'G'])
        end
    end

    return reverse(complement)
end

# Input is DNA string
# Returns a set of possible proteins
function possible_protein(dna)
    start = "ATG"
    i = 1
    proteins = Set{String}()
    while i < length(dna)-3 
        if dna[i:i+2] == start
            protein = ""
            j = i
            while j < length(dna)- 3 && stop_codons(dna[j:j+2])
                amino_acid = dna[j:j+2]
                protein *= codons[amino_acid]
                j+=3
            end
            if j < length(dna)- 3 && !stop_codons(dna[j:j+2])
                push!(proteins, protein)
            end
        end
        i+=1
    end
    return proteins
end

open("data/rosalind_orf.txt", "r") do f
    dna_fasta = parse_fasta(f)
    dna = ""
    for (i, j) in enumerate(dna_fasta)
        dna = j[2]
    end

    forward = possible_protein(dna)
    reverse = possible_protein((rev_comp(dna)))

    protein_union= union(forward, reverse)
    for seq in protein_union 
        println(seq)
    end

end
