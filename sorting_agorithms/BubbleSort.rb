# Bubble Sort

unsorted_list1 = 10.times.map{rand(100)}

def bubble_sort(list)
  swapped = true
  count = 1

  while swapped
    swapped = false
    i = 0
    while i < list.length-count
      if list[i] > list[i+1]
        list[i],list[i+1] = list[i+1],list[i] 
        swapped = true
      end
      i+=1
    end
    count+=1
  end

  return list
end


p unsorted_list1
p bubble_sort(unsorted_list1)