open("data/rosalind_rna.txt", "r") do file
    str = readline(file)
    rna_str = replace(str, "T", "U")
    print(rna_str)
end
