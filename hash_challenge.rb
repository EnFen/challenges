# person = {name: 'John', height: '2m', weight: '70kgs'}
# person.merge!({occupation: 'web developer', hobbies: 'art' })
# puts person
# person.delete(:weight)
# puts person
# person[:height]
# person.each { |attribute, value|
#     puts "#{attribute} :  #{value}"
# }

#Beast Mode
# items = [{ customer: "John", item: "Soup", cost: 8.50}, {customer: "Sarah", item: "Pasta", cost: 12}, {customer: "John", item: "Coke", cost: 2.50}]
# total_owing = 0
# items.select { |item| item[:customer] == "John"}.each { |owes| total_owing += owes[:cost]}

# puts "John owes $#{'%.2f' % total_owing}"

# items = eval(File.read('hash_challenge.txt'))

# while true
#     print "Enter a customer's name: "
#     cust_name = gets.chomp

# loop_end = false

# while loop_end != true
#         puts "What would you like to do to this customer's order?"
#         print "Input 1 to add items, 2 to work out the order total, or 'exit' to exit the program: "
#         input = gets.chomp.downcase

#         case input

#         when "2"
#             total = 0
#             for item in 0...items.length
#                 if items[item][:customer] == cust_name
#                     total += items[item][:cost].to_f
#                 end
#             end
#             puts "#{cust_name} owes $#{ "%.2f" % total}."

#         when "1"
#             print "What item would you like to add?: "
#             item = gets.chomp
#             print "How much does this item cost?: "
#             cost = gets.chomp
#             items << {customer: cust_name, item: item, cost: cost}
#             File.write('hash_challenge.txt', items)

#         when 'exit'
#             loop_end = true

#         else
#             puts "Invalid input."
#         end
#     end
# end

#Beast Mode ++

# my_dob = Time.new(1981, 11, 28) - Time.new(1981)

print "What is your birth year?: "
year = gets.chomp
print "What is your birth month?: "
month = gets.chomp
print "What is your birth day?: "
day = gets.chomp

your_dob = Time.new(year, month, day)# - Time.new(year)

# dob_difference = ((my_dob - your_dob)/(60 * 60 * 24)).to_i.abs

# puts dob_difference

require 'zodiac'

def zodiac_converter(date)
    return "Your zodiac sign is #{date.zodiac_sign}"
end

puts zodiac_converter(your_dob)

