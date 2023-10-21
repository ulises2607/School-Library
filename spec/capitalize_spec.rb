require 'rspec'
require_relative '../capitalize'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'lionel messi') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe 'correct_name' do
    it 'capitalizes the name' do
      expect(decorator.correct_name).to eq('Lionel messi')
    end
  end
end
