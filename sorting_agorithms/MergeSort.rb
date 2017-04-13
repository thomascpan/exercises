# Bubble Sort
require "benchmark"

unsorted_list1 = 10.times.map{rand(100)}
unsorted_list2 = unsorted_list1.dup
unsorted_list3 = unsorted_list1.dup

def merge_sort(list)
  return list if list.empty?
  return list if list.length == 1

  mid = list.length/2
  left_list = merge_sort(list[0...mid])
  right_list = merge_sort(list[mid..-1])
  i = 0
  l = 0
  r = 0

  while l < left_list.length && r < right_list.length
    if left_list[l] < right_list[r]
      list[i] = left_list[l]
      l+=1
    else
      list[i] = right_list[r]
      r+=1
    end
    i+=1
  end

  while l < left_list.length
    list[i] = left_list[l]
    l+=1
    i+=1
  end

  while r < right_list.length
    list[i] = right_list[r]
    r+=1
    i+=1
  end

  return list
end

Benchmark.bm do |x|
  p unsorted_list1
  x.report { p merge_sort(unsorted_list1) }

  p unsorted_list2
  x.report { p merge_sort(unsorted_list2) }

  p unsorted_list3
  x.report { unsorted_list3.sort }
end