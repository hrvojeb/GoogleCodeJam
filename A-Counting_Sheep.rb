#####################
## Google Code Jam ##
#####################
# https://code.google.com/codejam/contest/6254486/dashboard#s=p0
#

numbers_arr = []
#numbers_arr = [1692, 1, 2, 11, 0] # Test array
case_counter = 0

def output(a, c, message)
  puts "#{a}\tCase #{c}#: #{message}"
end

# Reading practice file and pushing values into array
File.open("A-small-practice.in").each do |value|
  numbers_arr << value.chomp.to_i
end

puts "Input\tOutput"
nr_of_cases = numbers_arr[0]
puts nr_of_cases

numbers_arr[1..nr_of_cases].each do |a|
  temp_array = []
  track_digits = (0..9).to_a
  n = 0

  case_counter += 1

  if a != 0
    until (track_digits - temp_array).empty? # Stop after temp_array is subset of track_digits
      n += 1
      new_nr = a * n
      temp_array.concat(new_nr.to_s.split("").map(&:to_i)) # Splitting number into digits and pushing digits into temp_array
    end
    output(a, case_counter, new_nr)
  else
    output(a, case_counter, "INSOMNIA")
  end
end
