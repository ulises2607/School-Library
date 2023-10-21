require 'rspec'
require_relative '../trimmer'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'This is a long name') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe 'correct_name' do
    it 'trims the name if it is longer than 10 characters' do
      expect(decorator.correct_name).to eq('This is a')
    end

    it 'does not trim the name if it is 10 characters or shorter' do
      short_name = double('Nameable', correct_name: 'ShortName')
      short_decorator = TrimmerDecorator.new(short_name)
      expect(short_decorator.correct_name).to eq('ShortName')
    end
  end
end
