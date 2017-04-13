# Spiral Print
# Print a 2D array in spiral order.

array1 = [[ 1, 2, 3, 4],
          [ 5, 6, 7, 8],
          [ 9,10,11,12],
          [13,14,15,16]]

def spiral_print(array)
  width = array.first.length
  height = array.length
  total = (width * height)-1

  width-=1
  height-=1

  directions = ["r", "d", "l", "u"]
  w = 0
  h = 0
  wmin = 0
  wmax = width
  hmin = 0
  hmax = height
  di = (0%directions.length)

  while total >= 0
    di = (di%directions.length)
    
    print array[h][w]
    print " "

    if directions[di] == "r"
      w+=1
    elsif directions[di] == "d"
      h+=1
    elsif directions[di] == "l"
      w-=1
    else directions[di] == "u"
      h-=1
    end

    if w < wmin
      w+=1
      h-=1
      di+=1
      hmax-=1
    elsif w > wmax
      w-=1
      h+=1
      di+=1
      hmin+=1
    elsif h < hmin
      h+=1
      w+=1
      di+=1
      wmin+=1
    elsif h > hmax
      h-=1
      w-=1
      di+=1
      wmax-=1
    end
        
    total-=1
  end
end


spiral_print(array1)