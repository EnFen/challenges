# def string_break(string, break_no)
#     result = []
#     for i in 0...string.length
#         if i % break_no == 0
#             result.push(string[i...i + break_no])
#         end
#     end
#     return result
# end

# test = "The quick brown fox jumps over the lazy dog."

# print string_break(test, 11)
# puts ''def string_break(string, break_no)
#     result = []
#     for i in 0...string.length
#         if i % break_no == 0
#             result.push(string[i...i + break_no])
#         end
#     end
#     return result
# end

# test = "The quick brown fox jumps over the lazy dog."

# print string_break(test, 11)
# puts ''

class UI
    def start_line
        puts "\e[H\e[2J"
        puts ''
    end

    def end_line
        puts ''
    end

    def prompt(string)
        start_line
        print string.capitalize
        response = gets.chomp
        return response
        end_line
    end

    def menu(array)
        start_line
        for line in array
            puts line.capitalize
        end
        end_line
    end

    def message(string)
        start_line
        puts string.capitalize
        end_line
    end

end

interface = UI.new
interface.menu(['What would you like to do?', 'Type "balance" to view your balance', 'Type "deposit" to make a deposit', 'Type "withdraw" to make a withdrawal', 'Type "history" to see transaction history', 'Type "exit" to end'])

# puts interface.prompt('Please enter your username: ')


# interface.message('Incorrect password')


