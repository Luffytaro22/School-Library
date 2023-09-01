require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  attr_accessor :classroom, :parent_permission

  def play_hooky
    '¯(ツ)/¯'
  end
end
