require 'colorize'

#puts 100 -5 * (2 -1) + 9 % 3

# def correct_change(item_price, cash_amount)
#     if cash_amount < item_price
#         puts "Please provide enough cash to pay for your item"
#     else
#         correct_change = cash_amount - item_price
#         puts "The correct change required is $#{'%.2f' % correct_change}"
#     end

# end 

# print "Please enter item price: $"
# item_price = gets.chomp.to_f
# puts item_price

# print "Please enter cash amount: $"
# cash_amount = gets.chomp.to_f
# puts cash_amount

# correct_change(item_price, cash_amount)

# arr = [1, 2, 3, 4, 5, 6, 7]

# arr.each do |item|
#     puts item
# end

# print "Please enter your age: "

# my_age = gets.chomp.to_i

# my_age < 18 ? (puts "You are not allowed to vote.") : (puts "You are allowed to vote.")

# arr= [12, 4, 10, 6, 7, 9, 11, 23, 33]

# def find_position(array, number)
#     puts array.index(number)

# end

# find_position(arr, 9)

# raining = false
# temperature = 25

# def weather_condition(raining, temperature)
#     if raining == true && temperature < 20
#         puts "It's wet and cold"
#     elsif raining == true && temperature >= 20
#         puts "It's raining, but warm"
#     elsif raining == false && temperature < 20
#         puts "It's cold, but not raining"
#     else
#         puts "It's warm and not raining"
#     end
# end

# weather_condition(raining, temperature)

# def reverse_string(input_string)
#     input_string.reverse
# end

# puts reverse_string('Hello')
# puts Colorize.methods


# def colorize_string(string, color)
#     color = color.to_sym
#     string.colorize(color)
# end

# puts colorize_string("Hello", "red")

def books_total_cost(selected_books)
    price_per_book = 8
    unique_books = selected_books.uniq
    
    while unique_books > 0
        for book in selected_books
            selected_books.count(book) - 1
            if selected_books.count(book) == 0
                selected_books.delete(book)
            end
        end
        unique_books = selected_books.uniq
    end



    # 
    # number_of_books = selected_books.count

    # case
    # when unique_books == 2
    #     percentage = 0.95
    # when unique_books == 3
    #     percentage = 0.90
    # when unique_books == 4
    #     percentage = 0.80
    # when unique_books == 5
    #     percentage = 0.75
    # else
    #     percentage = 1.00
    # end

    # total_cost = number_of_books * price_per_book * percentage

end

books_total_cost([1,1,2,2,3,3,3,4])