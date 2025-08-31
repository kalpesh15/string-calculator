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
  end
end
