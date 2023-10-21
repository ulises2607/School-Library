require 'rspec'
require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Math', 'Mr. Smith', parent_permission: true, id: 789) }

  describe '#can_use_services' do
    it 'returns true for teachers' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#to_json' do
    it 'returns teacher details as a JSON hash' do
      json_data = {
        'name' => 'Mr. Smith',
        'age' => 35,
        'specialization' => 'Math',
        'parent_permission' => true,
        'id' => 789,
        'class' => 'Teacher'
      }
      expect(teacher.to_json).to eq(json_data)
    end
  end
end
