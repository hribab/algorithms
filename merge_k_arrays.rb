# Complete the mergeArrays function below.

# This is a popular facebook problem. 
# Given K sorted arrays of size N each, merge them and print the sorted output. 
# Assume N is very large compared to K. N may not even be known. 
# The arrays could be just sorted streams, for instance, timestamp streams.
# All arrays might be sorted in increasing manner or decreasing manner. 
# Sort all of them in the manner they appear.

# Don't use inbuilt sorts or any standard sorting algorithm after simply merging the lists.

# Repeats are allowed.
# Negative numbers and zeros are allowed.
# Assume all arrays are sorted in the same order. Preserve that sort order in output.
# It is possible to find out the sort order from at least one of the arrays.

# Input Format:
# 	2-D Integer array
# 	Repeats possible
# 	Individual integer array is sorted

# Output Format:
# 	Return an integer array containing all elements from all individual arrays combined.

# Constraints:
# 	2 <= N <= 500
# 	1 <= K <= 500
# 	-10^6 <= element <= 10^6

require 'byebug'
def mergeArrays(arr)

	sort_order = 0
	first_array = arr[0]
	if first_array[0] < first_array.length
		sort_order = 1
	else 
		sort_order = -1
	end

	(0..(arr.length - 1)).each do |current_array_index|
		# print "current_array is #{arr[current_array_index]}\n"
		# print "merging  #{arr[current_array_index]} and #{arr[current_array_index+1]}\n"
 		# print "i is: #{current_array_index}\n"
 		if arr[current_array_index+1] != nil
 				# print "merging  #{arr[0]} and #{arr[current_array_index+1]}\n"
			first_array = merge(first_array, arr[current_array_index+1])
		end
		# print "result #{arr}\n"
	end
	return first_array

end

# def merge(arr, start, mid, end)
def merge(left, right)

	output_array = []

	until left.empty? || right.empty?
		if left.first <= right.first
			output_array << left.shift
		else
			output_array << right.shift
		end
	end
	return output_array + left + right
end


arr = [ [1, 3, 5, 7],
            [2, 4, 6, 8],
            [0, 9, 10, 11] ]
# arr = [ [7, 5, 3, 1],
#             [8, 6, 4, 2],
#             [11, 10, 9, 0] ]


print mergeArrays(arr)

# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
