require_relative 'nameable'

# Base decorator
class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Capitalize Decorator
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Trimmer Decorator
class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    if original_name.length > 10
      original_name[0..9]  # Trim the name to maximum 10 characters
    else
      original_name
    end
  end
end
