require 'json'

class UI
    def start_line
        puts "\e[H\e[2J"
        puts ''
    end

    def new_line
        puts ''
    end

    def prompt(input)
        start_line
        if input.is_a? String
            print input.capitalize
        else
            print input
        end
        return gets.chomp
        new_line
    end

    def menu(array)
        #start_line
        new_line
        for line in array
            puts line.capitalize
        end
        new_line
        return gets.chomp        
    end

    def message(input)
        start_line
        puts input.capitalize
        #new_line
    end

    def list(input)
        new_line
        puts input
    end

end

class User
    attr_reader :interface, :username, :user_data, :balance, :history
    def initialize
        @interface = UI.new
        @username = @interface.prompt("Please enter your username?: ").downcase.to_sym
        
        begin
            @user_data = JSON.parse( File.read('user_data.txt'), :symbolize_names => true )
        rescue Errno::ENOENT => e
            @user_data = {}
        end

        verify_or_new        

        account = Account.new(self)
        account.options

    end

    def verify_or_new
        @pass_entry = false
        while !@pass_entry
            if !@user_data[@username]
                create_new_user(@username)
            else
                verify_user(@username)
            end
        end
       @balance = @user_data[@username][:balance]
    end

    def create_new_user(user)
        @user_data[user] = {}
        @password = @user_data[user][:password] = @interface.prompt( "Please select a password for your new account: " )
        @user_data[user][:balance] = 0
        @history = @user_data[user][:history] = []
        @pass_entry = true
    end

    def verify_user(user)
        @pass_entry = @interface.prompt( "Please enter your password: " )
        @password = @user_data[user][:password]
        @history = @user_data[user][:history]
        if @pass_entry == @password
            @pass_entry = true           
        else
            @interface.message( "Incorrect password" )
            @pass_entry = false            
        end
    end

end
    
class Account 
    def initialize(user)
        @interface = user.interface
        @username = user.username
        @user_data = user.user_data
        @balance = user.balance
        @history = user.history

    end

    def options
        choice = ''
        while choice != 'exit'            
            choice = @interface.menu(['What would you like to do?', 'Type "balance" to view your balance', 'Type "deposit" to make a deposit', 'Type "withdraw" to make a withdrawal', 'Type "history" to see transaction history', 'Type "exit" to end']).downcase

        case choice
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
                @interface.message( "Sorry, your selection was invalid" )
            end
        end
    end

    def balance
        @interface.message( "Your balance is $#{@balance}" )
    end
    
    def deposit
        deposit = @interface.prompt( "How much would you like to deposit?: ").to_i
        @balance += deposit
        @interface.message( "You have successfully deposited $#{deposit}" )
        t = Time.now
        @history.push(["#{t.day}/#{t.mon}/#{t.year} #{t.hour}:#{t.min}.#{t.sec}", "Deposit: $#{deposit}"])
    end
    
    def withdraw
        withdraw = @interface.prompt( 'How much would you like to withdraw?: ' ).to_i
        if withdraw > @balance
            @interface.message( "That amount exceeds your balance" )
        else
            @balance -= withdraw
            @interface.message( "You have successfully withdrawn $#{withdraw}" )
            t = Time.now
            @history.push(["#{t.day}/#{t.mon}/#{t.year} #{t.hour}:#{t.min}.#{t.sec}","Withdrawal: $-#{withdraw}"])
        end        
    end

    def history
        @history.each { |transaction| 
            @interface.list(transaction) 
        }
    end

    def exit_app
        @user_data[@username][:balance] = @balance
        @user_data[@username][:history] = @history
        File.write( 'user_data.txt', JSON.dump(@user_data) )
        
        final = ''
        while final != 'exit'
            final = @interface.menu([ 'To fully exit app, type "exit"', 'To change accounts, type "change"' ]).downcase

        case final
            when 'exit'
                exit
            when 'change'
                customer = User.new
            else
                @interface.message( "Sorry, your selection was invalid" )
            end
        end
    end

end

customer = User.new