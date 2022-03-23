require_relative 'person'
require_relative 'homework'

class Student < Person
  attr_reader :homeworks

  def initialize(attributes)
    super

    @homeworks = []
  end

  def number_of_homeworks
    @homeworks.size
  end

  def homeworks
    return 'There are no homeworks' if number_of_homeworks.zero?

    @homeworks
  end

  def to_work!(homework)
    homework.mark_as_executing
    homework.start_executing_by self
  end

  def add_answer!(homework, answer)
    homework.add_answer(answer, self)
  end

  def to_check!(homework)
    homework.mark_as_done
  end
end
