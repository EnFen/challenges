class Account
    #@@user_data = File.read...

    def initialize(user)
        @user = user
    end

    def print_user
        puts "Your username is #{@user.capitalize}"
    end

    # def pass_check

    # end

    # def balance
    
    # end
    
    # def deposit

    # end
    
    # def withdraw

    # end

    # def history

    # end

    # def exit

    # end 
    
    private
    # def password

    # end

end

print "Please enter your username?: "
user = gets.chomp.downcase

account = Account.new(user)

account.print_user
