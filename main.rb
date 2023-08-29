require_relative 'nameable'

# Base decorator
class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable
  end
end
