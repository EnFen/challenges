choice = ''
clear_code = "\e[H\e[2J"

begin
    user_hash = eval(File.read('balance.txt'))
    
rescue Errno::ENOENT => e
    user_hash = {}
end

puts clear_code

pass_entry = false

while !pass_entry
    puts "Please enter your username"
    user = gets.chomp

    if !user_hash[user]
        user_hash[user] = {}
        puts 'Please select a password for your new account'
        password = user_hash[user]['password'] = gets.chomp
        user_hash[user]['balance'] = 0
        history = user_hash[user]['history'] = []
        pass_entry = true
        puts clear_code
    else
        puts "Please enter your password"
        pass_entry = gets.chomp
        password = user_hash[user]['password']
        history = user_hash[user]['history']
        if pass_entry == password
            pass_entry = true
            puts clear_code            
        else
            puts clear_code
            puts "Incorrect password"
            puts ''
            pass_entry = false            
        end
    end
end

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
        puts clear_code
        puts "Your balance is $#{user_hash[user]['balance']}"
        puts ''
    when 'deposit'
        puts ''
        puts 'How much would you like to deposit?'
        deposit = gets.chomp.to_i
        user_hash[user]['balance'] += deposit
        puts clear_code
        puts "You have successfully deposited $#{deposit}"
        puts ''
        t = Time.now
        history.push(["#{t.day}/#{t.mon}/#{t.year} #{t.hour}:#{t.min}.#{t.sec}", "Deposit: $#{deposit}"])
    when 'withdraw'
        puts ''
        puts 'How much would you like to withdraw?'
        withdraw = gets.chomp.to_i
        if withdraw > user_hash[user]['balance']
            puts clear_code
            puts 'That amount exceeds your balance'
            puts ''
        else
            user_hash[user]['balance'] -= withdraw
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
        File.write('balance.txt', user_hash) 
        exit
    else
        puts "Sorry, your selection was invalid"
        puts ''
    end
end

