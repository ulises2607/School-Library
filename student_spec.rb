   

require 'rspec'
require_relative '../student'

describe Student do
  let(:student) { Student.new(16, 'Alice', parent_permission: true, id: 456) }

  describe '#play_hooky' do
    it 'returns the shrug emoji' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#join_classroom' do
    it 'assigns the classroom and adds the student to the classroom' do
      classroom = double('Classroom', students: [])
      student.join_classroom(classroom)
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end

  describe '#to_json' do
    it 'returns student details as a JSON hash' do
      json_data = {
        'name' => 'Alice',
        'age' => 16,
        'id' => 456,
        'parent_permission' => true,
        'class' => 'Student'
      }
      expect(student.to_json).to eq(json_data)
    end
  end
end
