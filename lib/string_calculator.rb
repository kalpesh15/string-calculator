# frozen_string_literal: true

class StringCalculator
  def add(numbers)
    if numbers == ""
      return 0
    end

    num1, num2 = numbers.split(",")
    num1.to_i + num2.to_i
  end
end
