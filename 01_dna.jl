function CntNucleotide(s)
    count = fill(0, 4)
    i = 1

    while i <= length(s)
        if s[i] == 'A'
            count[1] += 1
        elseif s[i] == 'C'
            count[2] += 1
        elseif s[i] == 'G'
            count[3] += 1
        elseif s[i] == 'T'
            count[4] += 1
        end
        i+=1
    end

    return count
end

function print_dna(count)
    for elem in count
        @printf("%d ", elem)
    end
    println()
end

dna_file = open("data/rosalind_dna.txt", "r")
str = readline(dna_file)
count = CntNucleotide(str)
print_dna(count)
