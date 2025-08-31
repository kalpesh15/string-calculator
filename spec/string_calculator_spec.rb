# frozen_string_literal: true

require "spec_helper"
require "string_calculator"

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe "#add" do
    it "takes an empty string and returns 0" do
      expect(calculator.add("")).to eq(0)
    end

    it "task a single number and returns the sum" do
      expect(calculator.add("1")).to eq(1)
    end
  end
end
