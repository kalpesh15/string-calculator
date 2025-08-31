# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    if numbers == ""
      return 0
    end

    numbers.split(",").reduce(0) { |sum, number| sum + number.to_i }
  end
end
