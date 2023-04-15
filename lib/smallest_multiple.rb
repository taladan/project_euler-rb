# lib/smallest_multiple.rb

# 2520 is the smallest number that can be divided by
# each of the numbers 1 to 10 without any remainder.
# What is the smallest positive number that is evenly
# divisible by all of the numbers from 1 to 20?



def smallest_multiple_iterative(num)
  ans = 1
  for i in (1..num+1)
    ans = ((ans * i)/ans.gcd(i))
  end
  return ans
end

def smallest_multiple_recursive(num, steps=num, lcm=1)
  if steps == 0 
    return lcm
  end
  lcm = (lcm * steps/lcm.gcd(steps))
  smallest_multiple_recursive(num, steps-1, lcm)
end


num = 20
puts smallest_multiple_iterative(num)
puts smallest_multiple_recursive(num)