

def index_match(array)
  # write your code here
  max_ind = array.size - 1
  start = 0
  stop = array.size - 1
  pivot = (array.size - 1) / 2
  if array[pivot] > max_ind
    stop = pivot
  else
    start = pivot
  end
  start.upto(stop) do |indx|
    return indx if array[indx].eql?(indx)
  end

  -1
end

# puts index_match([0, 2, 3, 7, 9, 11])
# => 0

# p index_match([3, 5, 7, 9, 11, 13, 17])
# -1

# p index_match([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
# -1

# p  index_match([-4, -2, 0, 2, 4, 6, 8, 10])
# 4
p index_match([-25, -20, -15, -10, -5, 5, 7, 8, 9, 10, 11, 12])
# 5
