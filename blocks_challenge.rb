# def total(num1, num2)
#     return num1 + num2
# end

# puts total(4, 4)

def total(num1, num2)
    yield(num1, num2)
end

puts total(4, 4) { |num1, num2| 
    puts "The sum of the values is #{num1 + num2}"
    puts "The subtraction of the values is #{num1 - num2}"
}