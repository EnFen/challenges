balance = File.open('balance.txt').to_i
password = 'password'
choice = ''
clear_code = "\e[H\e[2J"
history = []
# balance = read file

puts clear_code
=begin
    ask for user name
    if username does not exist, add user and ask for password input. Store name and password
    if username does exist, verify user with password. if password matches stored value, allow access
    
=end
while choice != 'exit'
    puts "What would you like to do?"
    puts 'Type "balance" to view your balance'
    puts 'Type "deposit" to make a deposit'
    puts 'Type "withdraw" to make a withdrawal'
    puts 'Type "history" to see transaction history'
    puts 'Type "exit" to end'
    choice = gets.downcase.chomp    

    case choice
    when 'balance'
        puts "Please enter your password"
        pass_entry = gets.downcase.chomp
        if pass_entry == password
            puts clear_code
            puts "Your balance is $#{balance}"
            puts ''            
        else
            puts clear_code
            puts "Incorrect password"            
        end
    when 'deposit'
        puts ''
        puts 'How much would you like to deposit?'
        deposit = gets.chomp.to_i
        balance += deposit
        puts clear_code
        puts "You have successfully deposited $#{deposit}"
        puts ''
        t = Time.now
        history.push(["#{t.day}/#{t.mon}/#{t.year} #{t.hour}:#{t.min}.#{t.sec}", "Deposit: $#{deposit}"])
    when 'withdraw'
        puts ''
        puts 'How much would you like to withdraw?'
        withdraw = gets.chomp.to_i
        if withdraw > balance
            puts clear_code
            puts 'That amount exceeds your balance'
            puts ''
        else
            balance -= withdraw
            puts clear_code
            puts "You have successfully withdrawn $#{withdraw}"
            puts ''
            t = Time.now
            history.push(["#{t.day}/#{t.mon}/#{t.year} #{t.hour}:#{t.min}.#{t.sec}","Withdrawal: $-#{withdraw}"])
        end        
    when 'history'
        history.each { |v| 
        puts v 
        puts ''
        }
        puts ''
    when 'exit'
        # write balance to file on exit. call file balance.txt to start; maybe change name of file based on user later?
        #f = File.new('balance.txt', 'w')
        #f.write(balance)
        #f.close 
        open('balance.txt', 'w') { |f|
        f.puts balance.to_s
        }  
        exit
    else
        puts "Sorry, your selection was invalid"
        puts ''
    end
end

