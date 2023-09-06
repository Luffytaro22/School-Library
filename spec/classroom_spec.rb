require './classroom.rb'

describe Classroom do
  context "When testing classroom class" do
    it 'Creates a new classroom with a student' do
      class1 = Classroom.new('1A')
      student1 = double('student')

      allow(student1).to receive(:name) { 'Kaori Miyazono' }
      allow(student1).to receive(:classroom=).with(class1)
      class1.add_student(student1)

      expect(class1).to be_instance_of Classroom
      expect(class1.label).to eql '1A'
      class1.students.each do |student|
        expect(student.name).to match 'Kaori Miyazono'
      end
    end
  end
end
