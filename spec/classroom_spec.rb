require 'rspec'
require_relative '../classrom'

describe Classroom do
  let(:students) { [double('Student'), double('Student')] }
  let(:classroom) { Classroom.new('101', students) }

  describe 'attributes' do
    it 'has a label' do
      expect(classroom.label).to eq('101')
    end

    it 'has students' do
      expect(classroom.students).to eq(students)
    end
  end

  describe 'initialization' do
    it 'creates a new classroom with a label and students' do
      expect(classroom).to be_a(Classroom)
    end
  end
end
