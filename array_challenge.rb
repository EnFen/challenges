=begin
four_letter_animals = ['Calf', 'Duck', 'Elephant', 'Goat', 'Lamb', 'Lion', 'Mule', 'Dog']
puts four_letter_animals
puts ''
four_letter_animals << 'Puma'
puts ''
four_letter_animals.insert(4, 'Joey')
puts four_letter_animals
puts ''
four_letter_animals.delete('Dog')
puts four_letter_animals
puts ''
four_letter_animals.reverse!
puts four_letter_animals
puts ''
four_letter_animals.insert(four_letter_animals.index('Elephant'), 'Foal').delete('Elephant')
puts four_letter_animals
puts ''
four_letter_animals << 'Bear'
puts four_letter_animals
puts ''
four_letter_animals.reverse!
puts four_letter_animals
puts ''
=end
groc_list = []
3.times {
    puts ''
    puts 'Please provide an item for the grocery list'
    item = gets.chomp.downcase.capitalize
    puts ''
    if item == 'Icecream'
        item = 'Broccoli'
    end
    number = false
    while number == false
        puts 'How many of these items would you like?'
        number = Integer(gets.chomp) rescue false
        if !number
            puts ''
            puts 'Please provide an amount as a number'
        end 
    end
    groc_list << [item, number]
}
puts ''
puts "There are #{groc_list.length} items on your grocery list:"
puts ''
groc_list.each { |item, amount|
    puts item.ljust(20) + amount.to_s        
}
puts ''
