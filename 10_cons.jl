using Match
include("scripts/fasta.jl")
using fasta

function get_concensus(A::Array, C::Array, G::Array, T::Array)
    for i = 1:length(A)
        max_elem = max(A[i], C[i], G[i], T[i])
        if max_elem == A[i]
            print('A')
        elseif max_elem == C[i]
            print('C')
        elseif max_elem == G[i]
            print('G')
        elseif max_elem == T[i]
            print('T')
        end
    end
    println()
end

function print_profile(arr::Array, letter::Char)
    print(letter, ": ")
    for i in arr
        print(i, " ")
    end
    println()
end

function get_letter(dna_arr)

    A = zeros(UInt32, length(dna_arr[1]))
    C = zeros(UInt32, length(dna_arr[1]))
    G = zeros(UInt32, length(dna_arr[1]))
    T = zeros(UInt32, length(dna_arr[1]))

    for i = 1:length(dna_arr[1])
        a_cnt::UInt32 = 0
        c_cnt::UInt32 = 0
        g_cnt::UInt32 = 0
        t_cnt::UInt32 = 0
        for (j,k) in enumerate(dna_arr)
            @match k[i] begin
                'A' => a_cnt += 1
                'C' => c_cnt += 1
                'G' => g_cnt += 1
                'T' => t_cnt += 1
            end
        end
        A[i] = a_cnt
        C[i] = c_cnt
        G[i] = g_cnt
        T[i] = t_cnt
    end
    return A, C, G, T 
end

open("data/rosalind_cons.txt", "r") do f
    dna_strings = parse_fasta(f)
    dna = Array{ASCIIString}(length(dna_strings))

    for (i, j) in enumerate(dna_strings)
        dna[i] = j[2]
    end

    nucMatrix = zeros(UInt32, 4, length(dna[1]))

    A, C, G, T = get_letter(dna)
    get_concensus(A, C, G, T)

    print_profile(A, 'A')
    print_profile(C, 'C')
    print_profile(G, 'G')
    print_profile(T, 'T')
    
end
