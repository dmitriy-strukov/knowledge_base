# Constant time O(1)
array = [1,2,3,4,5]
array[2] # O(1)


# Bubble sort O(n2)
# O(N * N) = O(n2)
def bubble_sort(numbers)
    permutation = nil

    while permutation != 0 do # N times
        permutation = 0

        numbers.each_with_index do |number, index| # N times
            next if numbers[index + 1].nil?

            if number > numbers[index + 1]
                numbers.insert(index + 1, numbers.delete_at(index))
                permutation += 1
            end
        end
    end

    numbers
end

# Linear time O(n)
def max_number(numbers)
    max = 0
    
    numbers.each do |number| # N times
        if number > max
            max = number
        end
    end

    max
end

# Logarithmic time O(log n)
def binary_search(numbers, element)
    min = 0
    max = numbers.size - 1

    index = nil

    while index.nil? do
      middle_element_index = (min + max) / 2 # Every iteration (N / 2) = O(log n)
      middle_element = numbers[middle_element_index]  
      
      if element < middle_element
        max = middle_element_index
      elsif element > middle_element
        min = middle_element_index
      elsif element == middle_element
        index = middle_element_index
      end
    end

    index
end

