# lib/largest_prime_factor.rb

# The prime factors of 13195 are 5, 7, 13, and 29.
# What is the largets prime factor of the number 600851475143 ?

target = 600851475143 


# A Prime number is a number that can only be divided by 1
# and itself.  Examples of prime numbers:
#
# [2, 3, 6, 7, 11, 13, ..].  
#
# The number 1 is not considered prime because 1 divides into
# everything.  



# The quickest way to find the factors of a number is to divide
# it by the smallest prime number that goes into it evenly with no 
# remainder.  Continue this process with each number you get until 
# you reach 1
# 
# To ease this process, I will be using the `prime` library that is
# included in Ruby.
require 'prime'


def largest_prime_fact_iterative(num)
  x = num
  factors = []
  Prime.each do |factor|
    # binding.pry
    break if factor > x
    remainder = 0
    while remainder == 0
      remainder = x % factor
      if remainder == 0
        factors << factor unless factors.include?(factor)
        x = x / factor 
      end
    end
  end
  factors.last
end

def largest_prime_fact_recursive(num, dividend=num, factor=1, factors=[])
  return factors.last if factor > dividend
  if factor.prime?
    remainder = 0
    while remainder == 0
      temp_div, remainder = dividend.divmod(factor)
      if remainder == 0
        dividend = temp_div
        factors << factor unless factors.include?(factor)
      end
    end
  end
  factor.odd? ? factor += 1 : factor += 2
  largest_prime_fact_recursive(num,dividend,factor,factors)
end


puts largest_prime_fact_iterative(target)
puts largest_prime_fact_recursive(target)