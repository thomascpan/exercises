# Insertion Sort

unsorted_list1 = 10.times.map{rand(100)}

def insertion_sort(list)
  pivot_index = 1

  while pivot_index < list.length
    i = pivot_index
    while i > 0 && list[i] < list[i-1]
      list[i],list[i-1] = list[i-1],list[i]
      i-=1
    end
    pivot_index+=1
  end

  return list
end

p unsorted_list1
p insertion_sort(unsorted_list1)