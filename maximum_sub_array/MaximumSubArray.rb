# Maximum Sub Array

# def max_sub_array_sum(array)
#   answer = 0
#   sum = 0
#   i = 0
#   max = -Float::INFINITY

#   while i < array.length
#     if sum+array[i] > 0
#       sum+=array[i]
#     else
#       sum = 0
#     end
#     max = array[i] if array[i] > max
#     answer = [answer,sum].max
#     i+=1
#   end 

#   return max if max < 0
#   return answer
# end

# Brute Force Approach: O(n^3)
# def max_sub_array_sum(array)
#   answer = -Float::INFINITY
#   j=0

#   while j < array.length
#     i=0
#     while (i+j) < array.length
#       temp_sum = sum(array[i..(i+j)])
#       answer = temp_sum if temp_sum > answer
#       i+=1
#     end
#     j+=1
#   end

#   return answer
# end

# def sum(array)
#   sum = 0
#   array.each do |e|
#     sum+=e
#   end
#   return sum
# end

# Brute Force Approach: O(n^2)
# def max_sub_array_sum(array)
#   answer = -Float::INFINITY
#   i = 0

#   while i < array.length
#     j = i
#     sum = 0
#     while j < array.length
#       sum+=array[j]
#       answer = sum if (sum > answer)
#       j+=1
#     end
#     i+=1
#   end

#   return answer
# end

# Recursion
# def max_sub_array_sum(array)
#   return array.first if array.length == 1

#   mid = array.length/2

#   left_msas = max_sub_array_sum(array[0..(mid-1)])
#   right_msas = max_sub_array_sum(array[mid..-1])
#   left_sum = -Float::INFINITY
#   right_sum = -Float::INFINITY
#   sum = 0

#   array.each do |e|
#     sum+=e
#     right_sum = [sum,right_sum].max
#   end

#   sum = 0
#   array.reverse.each do |e|
#     sum+=e
#     left_sum = [sum,left_sum].max
#   end

#   answer = [left_msas, right_msas].max
#   return [answer,left_sum+right_sum].max
# end

array1 = [1,-3,2,-5,7,6,-1,-4,11,-23]
array2 = [2,3,6,12,1,52]
array3 = [-2,-3,-6,-12,-1,-52]
array4 = [3,-2,5,-1]
p max_sub_array_sum(array1)
p max_sub_array_sum(array2)
p max_sub_array_sum(array3)
p max_sub_array_sum(array4)