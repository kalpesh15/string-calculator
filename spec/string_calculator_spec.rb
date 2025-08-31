# frozen_string_literal: true

require "spec_helper"
require "string_calculator"

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe "#add" do
    it "takes an empty string and returns 0" do
      expect(calculator.add("")).to eq(0)
    end

    it "takes a single number and returns the sum" do
      expect(calculator.add("1")).to eq(1)
    end

    it "takes two numbers and returns the sum" do
      expect(calculator.add("1,2")).to eq(3)
    end

    it "takes random amount of numbers and returns the sum" do
      expect(calculator.add("1,2,3,10")).to eq(16)
    end

    it "allows '\\n' as well as ',' character between numbers and returns sum" do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "allows to specify delimiter at the beginning of string and returns sum" do
      expect(calculator.add("//;\n1;2;4")).to eq(7)
    end

    it "throws an exception if negative number is passed" do
      expect { calculator.add("1,-2,3") }.to raise_error(ArgumentError, "negative numbers not allowed -2")
    end

    it "throws an exception if multiple negatives numbers are passed with correct error message" do
      expect { calculator.add("1,-2,3\n-4,-6") }.to raise_error(ArgumentError, "negative numbers not allowed -2, -4, -6")
    end

    it 'ignores numbers greater than 1000 and returns sum of rest of numbers' do
      expect(calculator.add("1,2,1001,5")).to eq(8)
    end

    context 'when delimiters of any length are specified at the beginning of the string' do
      it 'return sum' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when multiple delimiters of length 1 are specified at the beginning of the string' do
      it 'return sum' do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'when multiple delimiters of length more than 1 are specified at the beginning of the string' do
      it 'return sum' do
        expect(calculator.add("//[**][%%]\n1**2%%3")).to eq(6)
      end
    end
  end

  describe "#get_called_count" do
    it 'returns no of times #add method was called' do
      expect(calculator.get_called_count()).to eq(0)
    end

    it 'returns no of times #add was called when called multiple times' do
      calculator.add("1,2,3")
      calculator.add("1,2,3")
      expect(calculator.get_called_count()).to eq(2)
    end
  end
end
