class Account   
    def initialize
        puts ''
        print "Please enter your username?: " 

        @user = gets.chomp.downcase.to_sym

        require 'json'

        begin
            @user_data = JSON.parse( File.read('user_data.txt'), :symbolize_names => true )
        rescue Errno::ENOENT => e
            @user_data = {}
        end

        @clear_code = "\e[H\e[2J"
        @pass_entry = false

        pass_check(@user)
    end

    def pass_check(user)
        while !@pass_entry
            if !@user_data[user]
                @user_data[user] = {}
                print 'Please select a password for your new account: '
                @password = @user_data[user][:password] = gets.chomp
                @user_data[user][:balance] = 0
                @history = @user_data[user][:history] = []
                @pass_entry = true
                puts @clear_code
            else
                print "Please enter your password: "
                @pass_entry = gets.chomp
                @password = @user_data[user][:password]
                @history = @user_data[user][:history]
                if @pass_entry == @password
                    @pass_entry = true
                    puts @clear_code            
                else
                    puts @clear_code
                    puts "Incorrect password"
                    puts ''
                    pass_entry = false            
                end
            end
        end
       options
    end

    def options
        @choice = ''
        while @choice != 'exit'
            puts ''
            puts "What would you like to do?"
            puts 'Type "balance" to view your balance'
            puts 'Type "deposit" to make a deposit'
            puts 'Type "withdraw" to make a withdrawal'
            puts 'Type "history" to see transaction history'
            puts 'Type "exit" to end'
            puts ''
            @choice = gets.downcase.chomp    
        
        case @choice
            when 'balance'
                balance
            when 'deposit'
                deposit
            when 'withdraw'
                withdraw
            when 'history'
                history
            when 'exit'
                exit_app
            else
                puts "Sorry, your selection was invalid"
                puts ''
            end
        end
    end

    def balance
        puts @clear_code
        print "Your balance is $#{@user_data[@user][:balance]}"
        puts ''
    end
    
    def deposit
        puts ''
        print 'How much would you like to deposit?: '
        @deposit = gets.chomp.to_i
        @user_data[@user][:balance] += @deposit
        puts @clear_code
        puts "You have successfully deposited $#{@deposit}"
        puts ''
        @t = Time.now
        @history.push(["#{@t.day}/#{@t.mon}/#{@t.year} #{@t.hour}:#{@t.min}.#{@t.sec}", "Deposit: $#{@deposit}"])
    end
    
    def withdraw
        puts ''
        print 'How much would you like to withdraw?: '
        @withdraw = gets.chomp.to_i
        if @withdraw > @user_data[@user][:balance]
            puts @clear_code
            puts 'That amount exceeds your balance'
            puts ''
        else
            @user_data[@user][:balance] -= @withdraw
            puts @clear_code
            puts "You have successfully withdrawn $#{@withdraw}"
            puts ''
            @t = Time.now
            @history.push(["#{@t.day}/#{@t.mon}/#{@t.year} #{@t.hour}:#{@t.min}.#{@t.sec}","Withdrawal: $-#{@withdraw}"])
        end        
    end

    def history
        puts ''
        @history.each { |v| 
        puts v 
        puts ''
        }
        puts ''
    end

    def exit_app
        File.write( 'user_data.txt', JSON.dump(@user_data) ) 
        
        while @final != 'exit'
            puts ''
            puts 'To fully exit app, type "exit"'
            puts 'To change accounts, type "change"'
            puts ''

            @final = gets.chomp.downcase

        case @final
            when 'exit'
                exit
            when 'change'
                initialize
            else
                puts "Sorry, your selection was invalid"
                puts '' 
            end
        end
    end

end

#Consider creating a Customer class, verifying that customer exists (or create new customer) using pass_check method, then keep all other methods in Account class
#Consider creating a UI class, which can be used to create user input and output
account = Account.new