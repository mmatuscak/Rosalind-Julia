# Rosalind problem 19 
#
function print_arr(arr)
    for i in arr
        print(i, " ")
    end
    println()
end

function gen_array(num::UInt8)
    num_arr = Array{UInt8, 1}()
    for i = 1:num
        push!(num_arr, i)
    end

    return num_arr
end
function permutation(num_arr, i)
    if length(num_arr) == i
        print_arr(num_arr)
    end
    j = i
    for j = i:length(num_arr) 
        num_arr[i], num_arr[j] = num_arr[j], num_arr[i]
        permutation(num_arr, i+1)
        num_arr[i], num_arr[j] = num_arr[j], num_arr[i]
    end

end

open("data/rosalind_perm.txt", "r") do f
    num = readline(f)
    num = parse(UInt8, num)
    num_arr = gen_array(num)

    println(factorial(num))
    permutation(num_arr, 1)
end
