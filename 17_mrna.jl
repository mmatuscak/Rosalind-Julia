# Rosalind problem 17 Inferring mRNA from Protein.
# The Given is a protein string of at most 1000 aa
# Return the total number of different RNA strings the protein could be translated from.
open("data/rosalind_mrna.txt", "r") do f
    # The number of times each amino acid occurs in the codon table
    AA_count = Dict([('A', 4), ('R', 6), ('N', 2), ('D', 2), ('C', 2), ('Q', 2), ('E', 2),
                   ('G', 4), ('H', 2), ('I', 3), ('L', 6), ('K', 2), ('M', 1), ('F', 2),
                   ('P', 4), ('S', 6), ('T', 4), ('W', 1), ('Y', 2), ('V', 4)])
    protein::String = strip(readline(f))
    total = 1 * 3 # start * stop amino acids
    mod = 1e6

    for aa in protein
        total *= AA_count[aa]
        total %= mod 
    end

    println(total)

end
