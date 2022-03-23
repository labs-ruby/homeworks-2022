require_relative 'person'

class MentorObserver
  def homework_was_created(student)
    student.notify("++ New homework was created.")
  end

  def homework_was_checked(student)
    student.notify("++ New homework was created.")
  end

  def homework_was_rejected(student)
    student.notify("-- Homework was rejected.")
  end
end

class Mentor < Person
  attr_accessor :name, :surname

  def initialize(attributes)
    super

    @homeworks = []
    @subscribtions = []
  end

  def add_homework(attributes)
    title, description, student = attributes.fetch(:title), attributes.fetch(:description), attributes.fetch(:student)
    
    MentorObserver.new.homework_was_created(student)
    @homeworks << Homework.new(title, description)
  end

  def reject_to_work!(homework)
    homework.mark_as_rejected

    MentorObserver.new.homework_was_rejected(homework.executors.first)
  end

  def accept!(homework)
    homework.accept
  end

  def subscribe_to!(student)
    @subscribtions << student
  end
end

# puts "-- Homework #{homework.title} was rejected."