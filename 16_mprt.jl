# Rosalnd problem 16. Find each protein with the N-glycosylation motif.

using Requests

function sequence(protein)
    url = string("http://www.uniprot.org/uniprot/", protein, ".fasta")
    res = get(url)
    res = readstring(res)
    res = split(res, '\n')

    seq = ""
    for i = 2 : length(res)
        seq *= res[i]
    end

    return seq
end

open("data/rosalind_mprt.txt", "r") do f
    for protein in eachline(f)
        seq = sequence(strip(protein))
        r = eachmatch(r"[N][^P][ST][^P]", seq, true)
        # No matches
        if isempty(r)
            continue
        else
            println(strip(protein))
            for m in r
                print(m.offset, " ")
            end
            println()
        end
    end
end
