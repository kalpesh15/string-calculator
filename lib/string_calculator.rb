# frozen_string_literal: true

class StringCalculator
  def add(number)
    if number == ""
      return 0
    end

    number.to_i
  end
end
