require 'pry'

def overlap(arry)
  res = []
  arry.each_with_index do |curr, i|
    nex = arry[i + 1]

    binding.pry
    if !nex.nil? && curr[1] >= nex[0]
      if !res.empty?
        if res.last[1] >= nex[0]
          res.last[1] = nex[1]
        else
          res << [curr[0], [nex[1], curr[1]].max]
        end  
      else
        res << [curr[0], [nex[1], curr[1]].max]
      end
    else
      if i != 0
        if res.last[1] < curr[1]
          res << curr
        end
      else
        res << curr
      end
    end
  end

  res
end

# Ya que se atraviesa todo el array item por item el tiempo es O(N)
# Ya que se trabaja en el mismo array, el espacio es constante O(1)

Tenemos un array con arrays adentro de length 2 en el cual se tienen que mergear los que se solapen

[[1,5], [2,6]] = [[1,6]]
[[1,5], [6,8]] =  [[1,5], [6,8]]

[[1,3], [4,5], [6,7]] = [[1,3], [4,5], [6,7]]
[[1,5], [2,6], [8,9]] = [[1,6], [8,9]]

[[1,5], [2,4]] = [[1,5]]

[[1,5], [2,2], [2,3], [7,10]] = [[1,5], [7,10]]

def overlap(arr)
  res = []
  arr.each_with_index do |current, i|
    next_arr = arr[i + 1]

    res << current if next_arr.nil?
    if res.last[1] >= next_arr[0]
      res << [current[0], [current[1], next_arr[1]].max]
    else
      res << current
    end
  end
end

Bonus -> Performance, buenas prácticas
