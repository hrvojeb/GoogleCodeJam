#####################
## Google Code Jam ##
#####################
# https://code.google.com/codejam/contest/6254486/dashboard#s=p1
#

pancakes_arr = []
# pancakes_arr = ["--++-++-+"] # Test array
case_counter = 0

class Object
  def flip_pancake
    self == '+' ? '-' : '+'
  end

  def output(a, c, message)
    puts "#{a}\tCase #{c}#: #{message}"
  end
end

# Reading practice file and pushing values into array
File.open("B-small-practice.in").each do |value|
 pancakes_arr << value.chomp
end

puts "Input\tOutput"
nr_of_cases = pancakes_arr[0].to_i
puts nr_of_cases

pancakes_arr[1..nr_of_cases].each do |a|
  flip_counter = 0
  temp_array = Array.new.concat(a.split("").map(&:to_s)) # Splitting pancakes stack into array
  original_array = temp_array.dup

  case_counter += 1

  if temp_array.include?("-") # If stack array doesn't include blank side up, then all pancakes are happy side up :D
    loop do
      flip_counter += 1

      (temp_array.size).times do |i|
        if (temp_array[i + 1] != temp_array[i]) # If next pancake is flipped different side then current we should start flipping
          (0..i).each do |j|
            temp_array[j] = temp_array[j].flip_pancake # Flip pancakes
          end
          break # Stop after flipping
        end
      end
    break unless temp_array.include?("-") # repeat flipping pancake stack array until all pancakes are flipped happy side up
    end
  end
  output(original_array, case_counter, flip_counter)
end
