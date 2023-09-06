require './person.rb'

describe Person do
  context "When testing the Person class"do
    it "Create a new instance of person without passing a name" do
      person1 = Person.new(23)
      expect(person1.id).to be_kind_of Numeric
      expect(person1.age).to eq 23
      expect(person1.name).to eql 'Unknown'
      expect(person1.can_use_services?).to be true
    end

    it "Create a new instance of person with a name and parent permission parameters" do
      person2 = Person.new(14, 'Kaori Miyazono', parent_permission: false)
      expect(person2.id).to be_kind_of Numeric
      expect(person2.age).to eq 14
      expect(person2.name).to eql 'Kaori Miyazono'
      expect(person2.can_use_services?).to be false
    end
  end
end
