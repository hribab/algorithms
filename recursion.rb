require 'byebug'



# Assume that the input is an array of size 'n' where 'n' is an even number. 
# Additionally, assume that  half the integers are even and the other half are odd. 
# Print only those permutations where odd and even integers alternate, starting with odd.

# Pause and write code for this problem. Possible code structure will be in next section.

# If the index is even, the value should be odd.

# Assume that the input is an array of characters. 
# Print any one permutation that is also a word in the dictionary. 
# Assume that you have two library functions you can use.

# bool ValidWord(char array a) 
#   returns true if and only if the string a is a dictionary word.
# bool ValidWordPrefix(char array a, int a_size) 
#   returns true if and only if a[0...a_size-1] is a prefix of at least one word in the dictionary.
# Pause to write the code. Possible code structure will be in next section.



def permuteMain(arr)
	i = 0
	print permute(arr, i)
end

def permute(arr, i)
	# print "permute(#{arr}, #{i})\n"
	print "#{arr}\n" if i == arr.length - 1 

	j = i
	while j < arr.length
		arr.swap!(i,j)
		permute(arr, i+1)
		arr.swap!(i,j)  # Need to keep array in original form/before permute
		j = j + 1
	end
end

def validWord(arr)
	return true if arr == ["a", "b", "c", "d"]
	return true if arr == ["c", "a", "c", "d"]
	return true if arr == ["a", "c", "b", "d"]
	return true if arr == ["a", "b", "d", "c"]
	return false
end

class Array
  def swap!(a,b)
    if self[a] != self[b]
      # print "#{self}\nswapping #{self[a]} and #{self[b]}\n"
    end
    self[a], self[b] = self[b], self[a]
    if self[a] != self[b]
      # print "#{self}\n\n"
    end
  end
end
# arr = [15, 7, 20, 7]
# permuteMain(arr)

arr = ["a", "b", "c", "d"]
permuteMain(arr)


