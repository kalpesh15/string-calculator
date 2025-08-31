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

    numbers.split(/[#{delimiters}]/).reduce(0) { |sum, number| sum + number.to_i }
  end
end
