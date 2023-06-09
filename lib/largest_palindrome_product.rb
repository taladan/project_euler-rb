# lib/largest_palindrome_product.rb
require "pry-byebug"

# A palindromic number reads the same both ways.
# The largest palindrome made from the product of
# two 2-digit numbers is 9009 = 91 x 99.

# Find the largest palindrome made from the product of 
# two 3-digit numbers.

def largest_palindrome_product_iterative(start)
  output = []
  array = start.downto(100).to_a
  products = array.product(array).map {|a, b| a * b}
  products.each do |product|
    output << product if product.to_s == product.digits*''
  end
  output.max
end

def largest_palindrome_product_recursive(start, steps=start, products = [])
  return products.max if start <= 100
  while steps >= 100
    product = start * steps
    products << product if product.to_s == product.digits*''  
    steps -= 1
  end
  largest_palindrome_product_recursive(start-1, start, products)
end

target = 3

puts largest_palindrome_product_iterative(999)
puts largest_palindrome_product_recursive(999)
