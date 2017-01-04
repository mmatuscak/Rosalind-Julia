# Rosalind problem 15, Independent Alleles 
# The probability that at least N AaBb organisms will belong to the kth generation.
# All organisms always mate with an AaBb. 
# Inputs are k = the number of generations and n = number of organisms in kth gen AaBb.

open("data/rosalind_lia.txt", "r") do f
    line = readline(f)
    k, n = split(line, " ")
    k = parse(BigInt, k)
    n = parse(Int, n)

    # The probability of AaBb mating with any genotype is always 1/4
    k2 = 2^k
    probs = [binomial(k2, i) * .25^i * .75^(k2-i) for i in range(n, k2)]
    prob_AaBa = sum(probs)

    println(round(prob_AaBa, 5))
end
