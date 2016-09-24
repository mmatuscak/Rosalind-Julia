using Match

open("data/rosalind_revc.txt", "r") do f

    dna_str = readline(f)
    complement = ""

    for base in dna_str
        @match base begin
            'A' => complement = join([complement, 'T'])
            'T' => complement = join([complement, 'A'])
            'G' => complement = join([complement, 'C'])
            'C' => complement = join([complement, 'G'])
        end
    end

    println(reverse(complement))
end
