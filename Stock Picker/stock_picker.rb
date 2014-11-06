# stock_picker sorts through the array finding the highest and lowest combinations to buy and sell from each day of stocks. It finds the sale price and then places these in a hash.

def stock_picker(array)
  array = array	
  hash = { }	
  low_to_high = array.sort
  high_to_low = array.sort.reverse
  high_to_low.each do |high|
    low_to_high.each do |low|
      if array.index(high) > array.index(low)
        sold_price = high - low
        hash[sold_price] = array.index(low), array.index(high)
     end
    end
  end
  best_answer(hash)
end

# the hash is then sorted to find the highest sale price

def best_answer(hash)
  highest_key = hash.max_by{|k,v| k}
  puts "The highest amount you can make is $#{highest_key[0]}."
  puts "Your best choice is to select the following numbers from the array index: #{highest_key[1]}."
end
	


stock_picker([17,3,6,9,15,8,6,1,10])
