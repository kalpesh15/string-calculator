# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    if numbers == ""
      return 0
    end

    delimiters = ",\n"

    if numbers.start_with?("//")
      custom_delimiter, numbers = numbers.split("\n")
      delimiters += custom_delimiter[2..]
    end

    numbers = numbers.split(/[#{delimiters}]/).map(&:to_i)
    
    negative_numbers = numbers.select { |number| number < 0 }

    if negative_numbers.any?
      raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(", ")}"
    end

    numbers.sum
  end
end
