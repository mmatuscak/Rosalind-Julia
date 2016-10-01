# Rosalind problem 6
# Find the Hamming Distance between two DNA strings

function hamming_distance(s1, s2)
    if length(s1) != length(s2)
        error("String lengths not equal")
    else
        return sum([ch1 != ch2 for (ch1, ch2) in zip(s1, s2)])
    end
end

open("data/rosalind_hamm.txt", "r") do file
    str1 = strip(readline(file))
    str2 = strip(readline(file))

    println(hamming_distance(str1, str2))
end
