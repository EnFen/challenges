def string_break(string, break_no)
    result = []
    for i in 0...string.length
        if i % break_no == 0
            result.push(string[i...i + break_no])
        end
    end
    return result
end

test = "The quick brown fox jumps over the lazy dog."

print string_break(test, 11)
puts ''