list1 = (1..100).to_a
list2 = [2,4,10,10,10,18,20]
list3 = [11,12,2,3,5,8]
list4 = [12,14,18,21,3,6,8,9]

# Iterative
def binary_search1(list,value)
  low = 0
  high = list.length-1

  while low <= high
    mid = (low+high)/2

    return mid if value == list[mid]

    if value < list[mid]
      high = mid-1
    else
      low = mid+1
    end
  end

  return -1
end

# Recurssive
def binary_search2(list,low = 0,high = list.length-1,value)
  if low <= high
    mid = (low+high)/2

    return mid if value == list[mid]

    if value < list[mid]
      high = mid-1
    else
      low = mid+1
    end
    return binary_search2(list,low,high,value)
  end

  return -1
end

# Iterative search on Circular Array
# No duplicates.
def binary_search3(list,value)
  low = 0
  high = list.length-1

  while low <= high
    mid = (low+high)/2

    return mid if value == list[mid]

    if list[mid] < list[high]
      return high if value == list[high]
      if value > list[mid] && value < list[high]
        low = mid+1
      else
        high = mid-1
      end
    else
      return low if value == list[low]
      if value < list[mid] && value > list[low]
        high = mid-1
      else
        low = mid+1
      end
    end
  end

  return -1
end

# First-Occurance Binary Search
def fo_search(list,value)
  low = 0
  high = list.length-1
  result = -1

  while low <= high
    mid = (low+high)/2

    if value == list[mid]
      high = mid-1
      result = mid
    elsif value < list[mid]
      high = mid-1
    else
      low = mid+1
    end
  end

  return result
end

# Last-Occurance Binary Search
def lo_search(list,value)
  low = 0
  high = list.length-1
  result = -1

  while low <= high
    mid = (low+high)/2

    if value == list[mid]
      low = mid+1
      result = mid
    elsif value < list[mid]
      high = mid-1
    else
      low = mid+1
    end
  end

  return result
end

def occurances(list,value)
  low = fo_search(list,value)
  return 0 if low == -1
  high = lo_search(list[low..-1],value)

  return high+1
end

# No duplicates.
def rotations(list)
  low = 0
  high = list.length-1

  while low <= high
    mid = (low+high)/2

    if list[low] < list[high]
      return low
    elsif list[mid] < list[mid-1]
      return mid
    elsif list[mid] < list[high]
      high = mid-1
    else
      low = mid+1
    end
  end
end

p binary_search1(list1,100)
p binary_search2(list1,100)

p fo_search(list2,10)
p lo_search(list2,10)

p occurances(list2,10)

p rotations(list3)

puts
[12,14,18,21,3,6,8,9].each do |e|
  p binary_search3(list4,e)
end