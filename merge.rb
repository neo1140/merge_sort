# Recursively slicing array in half until it returns a single element array.
def merge_sort(array)
  if array.length < 2
    array
  else
    left = array.slice(0...array.length/2)
    right = array.slice(array.length/2..-1)
    left = merge_sort(left)
    right = merge_sort(right)
    # Calls #merge method to put the sorted arrays back together properly
    merged_array = merge(left, right)
  end
end

def merge(left, right)
  # Initialize pointers for the two array halfs, and the final merged array
  i_left = 0
  i_right = 0
  i_merged = 0
  merged_array = []
  # Moves pointers through arrays moving the lowest value into the merged array
  while  i_left < left.length && i_right < right.length
    if left[i_left] < right[i_right]
      merged_array[i_merged] = left[i_left]
      i_left += 1
    else
      merged_array[i_merged] = right[i_right]
      i_right += 1
    end
    i_merged += 1
  end
  # When reached the end of one of the halfs, moves the rest of the values from the other half into the array
  if i_left == (left.length)
    right.each_with_index { |element, index| merged_array.push(element) if index >= i_right }
  else
    left.each_with_index { |element, index| merged_array.push(element) if index >= i_left }
  end
  merged_array
end

# Generating a random array to test the function
array = []
100.times do
  array << rand(1..100)
end
p merge_sort(array)
