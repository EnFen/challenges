require 'faker'
require 'terminal-table'
require 'colorize'
 
# #Let's see if we can make a fake person...
# person_name            = Faker::Name.name
# person_email           = Faker::Internet.email
# person_company         = Faker::Company.name
# person_company_slogan  = Faker::Company.bs
# person_phone           = Faker::PhoneNumber.phone_number
# person_address         = Faker::Address.street_address
# person_city            = Faker::Address.city
# person_state           = Faker::Address.state
# person_zip             = Faker::Address.zip_code
 
 
# # Wowee-wow-wow. Now let's print him off some business cards
# rows = []



# table = Terminal::Table.new { |t| 
# t << ["#{person_name}",""]

# t << ["#{person_company}",""]
# t << ["'#{person_company_slogan.capitalize}'",""]
# t << ["#{person_address}",""]
# t << ["#{person_city},", "#{person_state} #{person_zip}"]
# t << ["Call me at : #{person_phone}",""]
# t << ["Email me at: #{person_email}",""]
# t << ["It's a pleasure doing business.",""]
# t.style = {:all_separators => true, :border_x => '=', }
# }

# puts table

print 'Please enter a temperature in degrees Celsius: '

temp = gets.chomp.to_i


if temp > 30
    color = :red
elsif temp > 20
    color = :yellow
elsif temp > 10
    color = :cyan
elsif temp < 10
    color = :blue
end

puts "The temperature is " + "#{ temp * 9 / 5 + 32 }".colorize(color) + "  in degrees Farenheit"

# puts "This is blue".colorize(:blue)
# puts "This is light blue".colorize(:light_blue)
# puts "This is also blue".colorize(:color => :blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
# puts "This is light blue with red background".colorize(:light_blue ).colorize( :background => :red)
# puts "This is blue text on red".blue.on_red
# puts "This is red on blue".colorize(:red).on_blue
# puts "This is red on blue and underline".colorize(:red).on_blue.underline
# puts "This is blue text on red".blue.on_red.blink
# puts "This is uncolorized".blue.on_red.uncolorize
