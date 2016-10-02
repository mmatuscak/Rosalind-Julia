# Rosalind problem 7, Medel's First Law
# Find the probablilty that two randomly selected organisms produce
# an individual possessing a dominant allele.
# Inputs are three positive integers.

open("data/rosalind_iprb.txt", "r") do f
    line = readline(f)
    # k = homozygous  dominant, m = heterozygous, n = homozygous recessive
    k, m, n = split(line, " ")
    k = parse(UInt32, k)
    m = parse(UInt32, m)
    n = parse(UInt32, n)
    total = k + m + n

    # possiblities
    # kk, km, kn, mm, mk, mn, nn, nm, nk  
    dom_prob = k/total*(k-1)/(total-1) + k/total*m/(total-1) + k/total*n/(total-1) + 
    .75*m/total*(m-1)/(total-1) + m/total*k/(total-1) + .5*m/total*n/(total-1) + 0 +
    .5*n/total*m/(total-1) + n/total*k/(total-1)

    println(round(dom_prob,5))
end
