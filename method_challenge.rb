=begin
def say (comment)
    puts comment
end

say('Hello')
say('Welcome to my application!')
=end
def add (*numbers) 
    sum = 0   
    numbers.each { |number|
        sum += number
    }
    return sum
end

 puts add(2, 5, 7, 4)
 puts add(4, 6, 7, 8)