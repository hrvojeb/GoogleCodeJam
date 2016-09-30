#####################
## Google Code Jam ##
#####################
# https://code.google.com/codejam/contest/6254486/dashboard#s=p2
#

require 'prime'

nj_arr = []
case_counter = 1

class Object
  # Check if jamcoin base numbers are prime numbers
  def prime_base_2to10
    (2..10).each do |b|
      break false if self.to_i(b).prime?
    end
  end
end

# Reading practice file and pushing values into array
File.open("C-small-practice.in").each do |value|
  nj_arr << value.chomp.to_s
end

puts "Input\tOutput"
nr_of_cases = nj_arr[0].to_i
puts nr_of_cases

nj_arr[1..nr_of_cases].each do |a|
  temp_array = Array.new.concat(a.split(" ").map(&:to_i)) # Splitting N J into array
  i = 3 # Smallest jamcoin is 11, which is 3 in base 2
  n = temp_array[0]
  j = temp_array[1]

  puts "#{n} #{j}\tCase #{case_counter}#:"
  j_counter = 0

  loop do
    jamcoin = i.to_s(2)
    break if (j_counter == j) || (("1" * n) == jamcoin)
    if (jamcoin.size == n) && (jamcoin[0] == "1") && (jamcoin[n - 1] == "1") && (jamcoin.prime_base_2to10)
      j_counter += 1
      j_divisor_array = []

      p jamcoin
      (2..10).each do |base| # Iterating over bases
        (2..9).each do |divisor|
          break j_divisor_array << (jamcoin.to_i(base) / divisor) if jamcoin.to_i(base) % divisor == 0 # Push prime number of jamcoin base quotient
        end
      end
      puts "\t#{jamcoin} #{j_divisor_array.join(" ")}"
    end
    i += 1
  end
  case_counter += 1
end
