require './student.rb'

describe Student do
  context "When testing the student class"do
    it 'Create a new student without a name' do
      student1 = Student.new(16, '1A')
      expect(student1).to be_instance_of Student
      expect(student1.id).to be_kind_of Numeric
      expect(student1.age).to eq 16
      expect(student1.name).to eql 'Unknown'
      expect(student1.classroom).to eql '1A'
      expect(student1.can_use_services?).to be true
    end

    it 'Create a new student with a name' do
      student2 = Student.new(15, '7H', 'Mio', parent_permission: false)
      expect(student2).to be_instance_of Student
      expect(student2.id).to be_kind_of Numeric
      expect(student2.age).to eq 15
      expect(student2.name).to eql 'Mio'
      expect(student2.classroom).to eql '7H'
      expect(student2.can_use_services?).to be false
    end
  end
end
