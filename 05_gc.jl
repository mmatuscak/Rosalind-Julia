# rosalind.info/problems/gc
# Finding GC content in a string

# Get the total number of G and C
function count_gc(dna_str)
    gc_count = 0
    for i in dna_str
        if i == 'G' || i == 'C'
            gc_count  += 1
        end
    end
    return gc_count
end

# Find the ratio of G and C to the total
# number of nucleotides
function get_ratio(dna_str)
    current_gc = count_gc(dna_str)
    len = length(dna_str)
    ratio = current_gc / len

    return ratio
end

# Parse the fasta file
# TODO move this to a module.
# Will probably be used in other problems
function parse_fasta(file)
    seq_num = ASCIIString[]
    dna_seq = ASCIIString[]
    sequence = ""
    i = 1

    for line in eachline(file)
        if line[1] == '>'
            push!(dna_seq, sequence)
            head = strip(line[2:end])
            push!(seq_num, head)
            sequence = ""
            continue
        else
            sequence *= strip(line)
            #dna_seq[i] = sequence
        end
    end

    push!(dna_seq, sequence)
    #first item is an empty string 
    shift!(dna_seq)
    t = zip(seq_num, dna_seq)

end

open("data/rosalind_gc.txt", "r") do f
    name = "" 
    max_name = "" 
    max_gc = 0.0

    sequence = parse_fasta(f)

    for (i, j) in enumerate(sequence)
        name = j[1]
        ratio = get_ratio(j[2])
        #println(name)
        #println(ratio)
        if ratio > max_gc
            max_name = name
            max_gc = ratio
        end
    end

    println(max_name)
    println(max_gc*100)

end
