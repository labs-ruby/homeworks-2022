# frozen_string_literal: true

require_relative 'person'

class Student < Person
  def initialize(name:, surname:)
    super(name: name, surname: surname)
    @homeworks = []
  end

  def add_answer!(homework, answer)
    homework.answer = answer
  end

  def to_check!(homework)
    homework.status = 'to check'
    homework.mentor.notes << "Student #{name} send homework #{homework.title} to check\n" \
                              "Answer:#{homework.answer}\n"
  end

  def show_homeworks
    @homeworks.each do |homework|
      print "Homeworks:\n
            Title: #{homework.title}\n
            Description:#{homework.description}\n"
    end
  end

  def to_work!(homework)
    homework.mentor.notes << "Student #{name} took homework #{homework.title}\n"
  end
end
