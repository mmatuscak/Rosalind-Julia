# Rosalind problem 13: Calculating Expected Offspring
# Find the number of offspring displaying the dominant genotype in the next generation
# given the number of couples and each couple has two offspring.
function expected_value(genotypes)
    dominant_phen_exp = 2*(genotypes[1]*1 + genotypes[2]*1 + genotypes[3]*1 + genotypes[4]*.75
                           + genotypes[5]*.5 + genotypes[6]*0)
    println(dominant_phen_exp)
end
# genotypes AA-AA, AA-Aa, etc. Max of 20000
genotypes = readdlm("data/rosalind_iev.txt", ' ', UInt32)
expected_value(genotypes)
