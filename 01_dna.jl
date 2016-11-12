function CntNucleotide(lines)
    count = fill(0, 4)
    i = 1

    for s in lines
        len = length(s)
        while i <= len
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
        i = 1
    end

    return count
end

function print_dna(count)
    for elem in count
        @printf("%d ", elem)
    end
    println()
end

open("data/rosalind_dna.txt", "r") do file
    const str = readlines(file)
    const count = CntNucleotide(str)
    print_dna(count)
end
