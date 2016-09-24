function rabbit_fib(n, k)
    if n <= length(memoize)
        return memoize[n]
    else
        result = rabbit_fib(n-1, k) + rabbit_fib(n-2, k)*k
    end
    push!(memoize, result)
    return result
end

memoize = [1, 1]
open("data/rosalind_fib.txt", "r") do f
    line = readline(f)
    n, k = split(line, " ")
    n = parse(Int, n)
    k = parse(Int, k)
    rabbits = rabbit_fib(n, k)
    println(rabbits)
end
