# frozen_string_literal: true

require_relative 'person'

class Mentor < Person
  def initialize(name:, surname:)
    super(name: name, surname: surname)
    @students = []
  end

  def add_homework(title:, description:, student:)
    student.notes << "You have new homework to do\n"
    Homework.new(title: title, description: description, student: student, mentor: self)
  end

  def subscribe_to!(student)
    @students << student
  end

  def reject_to_work!(homework)
    homework.is_reject = true
    homework.student.notes << "Homework #{homework.title} is rejected\n"
  end

  def accept!(homework)
    homework.is_accept = true
    homework.student.notes << "Homework #{homework.title} is accepted\n"
  end
end
