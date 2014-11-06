def fizzbuzz(number)
	return 'fizzbuzz' if is_divisible_by_fifteen?(number)
	return 'buzz' if is_divisible_by_five?(number)
	return 'fizz' if is_divisible_by_three?(number)
	number
end

def is_divisible_by_three?(number)
	is_divisable_by?(number, 3)
end

def is_divisible_by_five?(number)
	is_divisable_by?(number, 5) 
end

def is_divisible_by_fifteen?(number)
	is_divisable_by?(number, 15)
end

def is_divisable_by?(number, divisor)
	number % divisor == 0
end
