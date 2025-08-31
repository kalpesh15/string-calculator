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

    delimiters = [",", "\n"]

    if has_custom_delimiter(numbers)
      custom_delimiter, numbers = numbers.split("\n")
      custom_delimiter = custom_delimiter[2..]

      if get_character_groups_count(custom_delimiter) == 0
        delimiters.push(custom_delimiter)
      else
        delimiters += custom_delimiter.scan(/\[(.*?)\]/).map(&:first)
      end
    end

    numbers = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    
    negative_numbers = numbers.select { |number| number < 0 }

    if negative_numbers.any?
      raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(", ")}"
    end

    numbers = numbers.filter { |number| number <= 1000 }

    numbers.sum
  end

  def get_called_count
    return @called_count
  end

  private

  def has_custom_delimiter(input)
    input.start_with?("//")
  end

  def get_character_groups_count(delimiters)
    delimiters.count("[")
  end
end
