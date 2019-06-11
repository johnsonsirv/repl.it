require 'set'
=begin
  
A duplicate is a number whose value appeared earlier in the list.
Given a list of numbers, return an array with all the duplicates in the order that they appear. 
(Duplicates that appear multiple times should be printed multiple times).
Use Ruby's Set class to solve the challenge.
=end
[1, 2, 3, 1, 5, 6, 7, 8, 5, 2].to_set
set = Set[1, 2, 3, 1, 5, 6, 7, 8, 5, 2]
Set.new([1, 2, 3, 1]) { |x| x * x }      #=> #<Set: {1, 4, 9}>
set.add(1) # =>returns self
set.add?(1) #-> returns nil if elem already exists in set
[1, 2, 3, 1, 5, 6, 7, 8, 5, 2] - [1, 2, 3, 5, 6, 7, 8]

def find_duplicates_set_approach(array)
  # write your code here
  duplicates = []
  
end

# Algorithm works on integers only
=begin
 1. Iterate the array from first element to the last
 2.  check for sign of A[abs(A[i])] ;
 if positive then
  make it negative by A[abs(A[i])]=-A[abs(A[i])];
  else
  i’th element of the Array will be repetitive
  O(N) - time complexity
  O(1) - space complexity - we are modifying the given array
=end
def find_duplicates_diff_alg(array)
  duplicates =[]
  0.upto(array.size - 1) do |index|
    next_index = array[index].abs
    current_element = array[next_index]
    # p "#{current_element}, ind: #{index}"
    if current_element.positive?
      array[next_index] = -current_element
    else
      duplicates << array[index].abs
    end
    # p array
  end
  duplicates
end

def find_duplicates_using_hash_set(array)
  
end

p find_duplicates_using_hash_set([1, 2, 3, 1, 5, 6, 7, 8, 5, 2])
# => [1, 5, 2]

# p find_duplicates([3, 501, 17, 23, -43, 67, 5, 888, -402, 235, 77, 99, 311, 1, -43])
# => [-43]

