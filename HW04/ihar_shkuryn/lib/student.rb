# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :notices, :homeworks_todo, :homeworks_in_progress

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @notices = []
    @homeworks_todo = []
    @homeworks_in_progress = []
  end

  def notifications
    @notices.each do |notice|
      puts notice
    end
  end

  def mark_as_read!
    notices.clear
  end

  def homeworks
    homeworks_todo.each do |hw|
      puts hw.description
    end
  end

  def to_work!(homework)
    homeworks_in_progress.push(homework)
    homework.mentor.notices.push("Student: #{presentation} started homework #{homework.title}")
  end

  def add_answer!(homework, answer)
    homework.answers.push(answer)
    homeworks_todo.delete(homework)
    homeworks_in_progress.push(homework)
  end

  def to_check!(homework)
    homework.mentor.homeworks_for_check.push(homework)
    homeworks_todo.delete(homework)
    homework.mentor.notices.push("Student: #{presentation} finished homework #{homework.title}")
  end

  def presentation
    "#{name} #{surname}"
  end
end
