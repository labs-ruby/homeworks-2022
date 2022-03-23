require_relative 'mentor'

class HomeworkObserver
  def homework_is_executing
    puts "> Homework is executing by '#{student.fullname}'"
  end

  def homework_answer_has_been_added
    puts "> Student '#{student.fullname}' added an answer for homework '#{@title}'."
  end

  def homework_has_been_rejected
    puts "-- Homework #{homework.title} was rejected."
  end
end

module HomeworkStatuses
  NEW = 0
  IN_PROGRESS = 1
  DONE = 2
  REJECTED = 3
  ACCEPTED = 4
end

class Homework
  include HomeworkStatuses

  attr_accessor :title, :description

  def initialize(title, description)
    @title = title
    @description = description
    @status = HomeworkStatuses::NEW
    @executors = []
    @answers = []
  end

  def add_executor(executor)
    @executors << executor
  end

  def start_executing_by(student)
    add_executor(student)
  end

  def add_answer(answer, student)
    @answers << { answer: answer, student: student }
  end

  def mark_as_executing
    @status = HomeworkStatuses::IN_PROGRESS
  end

  def mark_as_done
    @status = HomeworkStatuses::DONE
  end

  def mark_as_rejected
    @status = HomeworkStatuses::REJECTED
  end

  def mark_as_accepted
    @status = HomeworkStatuses::ACCEPTED
  end
end
