require './person.rb'

class Teacher < Person
  def initialize(specialization)
    super(name, age, parent_permission);
    @specializationi = specialization;
  end

  def can_use_services?
    true
  end
end
