# Rosalind problem 8, Translating RNA into Protein
# Input(s): an RNA string at most 10kpb
# Output(s): the encoded protein string

codons = Dict([("UUU", "F"), ("UUC", "F"), ("UUA", "L"), ("UUG", "L"),
               ("UCU", "S"), ("UCC", "S"), ("UCA", "S"), ("UCG", "S"),
               ("UAU", "Y"), ("UAC", "Y"), ("UAA", " "), ("UAG", " "),
               ("UGU", "C"), ("UGC", "C"), ("UGA", " "), ("UGG", "W"),
               ("CUU", "L"), ("CUC", "L"), ("CUA", "L"), ("CUG", "L"),
               ("CCU", "P"), ("CCC", "P"), ("CCA", "P"), ("CCG", "P"),
               ("CAU", "H"), ("CAC", "H"), ("CAA", "Q"), ("CAG", "Q"),
               ("CGU", "R"), ("CGC", "R"), ("CGA", "R"), ("CGG", "R"),
               ("AUU", "I"), ("AUC", "I"), ("AUA", "I"), ("AUG", "M"),
               ("ACU", "T"), ("ACC", "T"), ("ACA", "T"), ("ACG", "T"),
               ("AAU", "N"), ("AAC", "N"), ("AAA", "K"), ("AAG", "K"),
               ("AGU", "S"), ("AGC", "S"), ("AGA", "R"), ("AGG", "R"),
               ("GUU", "V"), ("GUC", "V"), ("GUA", "V"), ("GUG", "V"),
               ("GCU", "A"), ("GCC", "A"), ("GCA", "A"), ("GCG", "A"),
               ("GAU", "D"), ("GAC", "D"), ("GAA", "E"), ("GAG", "E"),
               ("GGU", "G"), ("GGC", "G"), ("GGA", "G"), ("GGG", "G")])

open("data/rosalind_prot.txt", "r") do f
    rna::ASCIIString = strip(readline(f))
    protein::ASCIIString = "" 

    i = 1
    while i < length(rna) - 3
        amino_acid = rna[i:i+2]
        protein *= codons[amino_acid]
        i+=3
    end

    println(protein)

end
