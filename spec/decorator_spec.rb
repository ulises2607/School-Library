require 'rspec'
require_relative '../decorator'

describe Decorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  let(:decorator) { Decorator.new(nameable) }

  describe 'attributes' do
    it 'has a nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe 'correct_name' do
    it 'delegates to the nameable object' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
