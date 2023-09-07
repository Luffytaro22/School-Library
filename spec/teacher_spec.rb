require './teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'Create a new teacher without a name' do
      teacher1 = Teacher.new(34, 'Doctor')
      expect(teacher1).to be_instance_of Teacher
      expect(teacher1.id).to be_kind_of Numeric
      expect(teacher1.age).to eq 34
      expect(teacher1.name).to eql 'Unknown'
      expect(teacher1.specialization).to eql 'Doctor'
      expect(teacher1.can_use_services?).to be true
    end

    it 'Create a new teacher with a name' do
      teacher2 = Teacher.new(45, 'Nurse', 'Elizabeth Jones')
      expect(teacher2).to be_instance_of Teacher
      expect(teacher2.id).to be_kind_of Numeric
      expect(teacher2.age).to eq 45
      expect(teacher2.name).to eql 'Elizabeth Jones'
      expect(teacher2.specialization).to eql 'Nurse'
      expect(teacher2.can_use_services?).to be true
    end
  end
end
