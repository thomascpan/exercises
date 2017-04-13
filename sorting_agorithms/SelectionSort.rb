# Selection Sort

unsorted_list1 = 10.times.map{rand(100)}
unsorted_list2 = 10.times.map{rand(100)}

def selection_sort(list)
  i = 0

  while i < list.length-1
    min_index = i
    j = i+1
    while j < list.length
      min_index = j if list[j] < list[min_index]
      j+=1
    end
    list[i],list[min_index] = list[min_index],list[i]
    i+=1
  end

  return list
end


p unsorted_list1
p selection_sort(unsorted_list1)