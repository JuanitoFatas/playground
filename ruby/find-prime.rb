# 先實現如何找到除數

def square(n)
  return n * n
end

# can b divided by a?
def divides?(a, b)
  return b.remainder(a) == 0
end

# based on the fact that if n is not prime
# it must have a divisor less than or equal to sqrt(n)
# results in O(sqrt(n))
def find_divisor(n, test_divisor)
  if square(test_divisor) > n
  	return n
  elsif divides?(test_divisor, n)
  	return test_divisor
  else
  	find_divisor(n, test_divisor+1)
  end
end

# 再實現如何找到最小除數（從2找起）

def smallest_divisor(n)
  find_divisor(n, 2)
end

# 由於質數本身是自己的最小除數 => 找到質數

# n is prime iff n is its own smallest divisor
def prime?(n)
  return smallest_divisor(n) == n
end

# 從給定的區間找一下，把非質數過濾掉

def find_prime(m=2, n)
  (m..n).find_all {|i|  prime?(i) == true }
end

unknown = 30000 # 20^9

find_prime(m=2, unknown)

