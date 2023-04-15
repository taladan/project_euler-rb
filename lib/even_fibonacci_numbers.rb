# lib/even_fibonacci_numbers.rb

target = 4_000_000

def even_fibonacci_numbers_iterative(goal)
  start = [0,1]
  sum = 0
  while start[-1] <= goal
    start << start[-1] + start[-2]
    if start[-1]%2==0
      sum += start[-1]
    end
  end
  sum
end

def even_fibonacci_numbers_recursive(goal, sequence=[0,1], sum=0)
  return sum if sequence.last >= goal
  if sequence.last % 2 == 0
    sum += sequence.last
  end
  sequence << sequence[-1] + sequence[-2]
  even_fibonacci_numbers_recursive(goal, sequence,sum )
end

puts even_fibonacci_numbers_iterative(target)
puts even_fibonacci_numbers_recursive(target)
