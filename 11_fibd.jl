# Rosalind problem 11 Mortal Fibonacci Rabbits
# An extension of problem 4.
#
# This is just a fibonacci sequence that subtracts out rabbits once they die.
function rabbit_fib(numMonths, lifeTime)
    if numMonths == 0 return 0 end
    if numMonths == 1 return 1 end

    if numMonths <= length(memo)
        return memo[numMonths]
    end
    if numMonths <= lifeTime
        numRabbits = rabbit_fib(numMonths-1, lifeTime) + rabbit_fib(numMonths-2, lifeTime)
    elseif numMonths == lifeTime + 1
        numRabbits = rabbit_fib(numMonths-1, lifeTime) + rabbit_fib(numMonths-2, lifeTime) - 1
    else
        numRabbits = rabbit_fib(numMonths-1, lifeTime) + rabbit_fib(numMonths-2, lifeTime) - rabbit_fib(numMonths-(lifeTime+1), lifeTime)
    end
    push!(memo, numRabbits)
    return numRabbits
end

memo = Array{UInt64}(0)
open("data/rosalind_fibd.txt", "r") do f
    push!(memo, 1)
    line = readline(f)
    numMonths, lifeTime = split(line, " ")
    numMonths = parse(UInt8, numMonths)
    lifeTime = parse(UInt8, lifeTime)
    rabbits::UInt64 = rabbit_fib(numMonths, lifeTime)
    println(rabbits)
end
