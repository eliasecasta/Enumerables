require_relative '../main.rb'

describe Enumerable do
  let(:var) {{ "cat" => 5, "jessica" => 2 }}
  describe '#my_each' do
    it 'Testing my_each' do
      expect(p var.my_each{|i| i+i}).to eql (var.each{|i| i+i})
    end
  end
  describe '#my_each' do
    it 'Testing my_each' do
      expect(p var.my_each{|i| i+i}).to eql (var.each{|i| i+i})
    end
  end
end
