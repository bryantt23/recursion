# https://github.com/betweenparentheses/project_recursion/blob/master/merge_sort.rb
#master merge_sort method. array goes in, sorted array comes out


def merge_sort(array)
#   base case of array size 1
  return array if array.size == 1
  
#   first half array
  first_half = array[0..((array.size-1)/ 2)]
  
#   second half array
  second_half = array [(((array.size - 1) / 2) + 1)..array.size - 1]
  
#   idk which array is bigger, just make sure that one gets the median, the other gets below or above it
  
# get the sorted first half by calling the method on the first half  
  first_half = merge_sort(first_half)
  second_half = merge_sort(second_half)
  
#   merge the first & second half
  merge(first_half, second_half)
end


#merges two sorted arrays into a larger sorted array
def merge(first_half, second_half)
  
#   empty array
  merged_array = []
  
#   while both halves have elements
  while first_half.size > 0 && second_half.size > 0 do
    
#     i think it's going to compare 0 elements
    if first_half [0] <= second_half[0]
      
#       if the first half 0 element is larger, push it onto the merged array
#       To retrieve and at the same time remove the first item, use shift
      merged_array.push(first_half.shift)
      
    elsif second_half[0] < first_half[0]
      merged_array.push(second_half.shift)
    end
  end

#once only one (sorted) array remains, just add on the rest of that array
#only one of these loops will ever run
  while first_half.size > 0 do 
    merged_array.push(first_half.shift)
  end
  while second_half.size > 0 do 
    merged_array.push(second_half.shift)
  end

  merged_array
end
  
#testing

p merge_sort([1,3,6,3,4,5,7,8,9,2,4,5,2,1]) # => [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 9]
p merge_sort([-9, 12, -99, 3, 45, 3]) # => [-99, -9, 3, 3, 12, 45]