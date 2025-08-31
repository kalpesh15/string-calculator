# frozen_string_literal: true

class StringCalculator
  def initialize
    @called_count = 0
  end

  def add(numbers)
    @called_count += 1

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

  def get_called_count
    return @called_count
  end
end
