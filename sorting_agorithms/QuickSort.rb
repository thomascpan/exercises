# Quick Sort
require "benchmark"

unsorted_list1 = 10.times.map{rand(100)}
unsorted_list2 = unsorted_list1.dup

def quick_sort(list, low, high)
  if low < high
    pivot_index = random_partition(list,low,high)
    quick_sort(list,low,pivot_index-1)
    quick_sort(list,pivot_index+1,high)
  end

  return list
end

def random_partition(list,low,high)
  pivot_index = rand(low..high)
  list[pivot_index],list[high] = list[high],list[pivot_index]
  return partition(list,low,high)
end

def partition(list,low,high)
  pivot = list[high]
  pivot_index = low
  i = low

  while i < high
    if list[i] < pivot
      list[pivot_index],list[i] = list[i],list[pivot_index]
      pivot_index+=1
    end
    i+=1
  end
  list[pivot_index],list[high] = list[high],list[pivot_index]

  return pivot_index
end

p unsorted_list1
p quick_sort(unsorted_list1, 0, unsorted_list1.length-1)