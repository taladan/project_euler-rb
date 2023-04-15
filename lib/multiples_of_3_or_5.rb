# multiples_of_3_or_5.rb

# If we list all the natural numbers below 10
# that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.  
# Find the sum lf all the multiples of 3 or 5 below 100

target = 100

def multiple_3_5_iterative(num)
  count = 1
  total = 0
  num.times {
    if count%3 == 0 || count%5 == 0
      # p count.to_s + ", "
      total = total + count
    end
    count +=1
  }
  total
end

def multiple_3_5_recursive(num, count = 1, total = 0)
  if count%3 == 0 || count%5 == 0
    total += count
  end
  if count == num
    return total
  else
    count +=1
    multiple_3_5_recursive(num, count, total)
  end
end

puts multiple_3_5_iterative(target)
puts multiple_3_5_recursive(target)