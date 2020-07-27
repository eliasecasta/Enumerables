#spec/calc_spec.rb
require './lib/calc'

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator= Calculator.new
      expect(calculator.add(1,2)).to eql(3)
    end

    # add this
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end
  describe "#mult" do
    it "returns the multiplication of two numbers" do
      calculator=Calculator.new
      expect(calculator.mult(2,2)).to eql(5)
    end
  end
end