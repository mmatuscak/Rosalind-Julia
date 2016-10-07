# basic script for parsing fasta files 

# output is a tuple of the sequence name and the sequence
module fasta
export parse_fasta
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

    return t
end
end
