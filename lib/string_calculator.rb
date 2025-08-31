# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    if numbers == ""
      return 0
    end

    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers.split("\n")
      custom_delimiter = custom_delimiter[2..]
  
      return numbers.split(/#{custom_delimiter}/).reduce(0) { |sum, number| sum + number.to_i }
    end

    numbers.split(/,|\n/).reduce(0) { |sum, number| sum + number.to_i }
  end
end
