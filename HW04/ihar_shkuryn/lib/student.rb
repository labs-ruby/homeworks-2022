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

  def student_filename
    "#{presentation}.txt"
  end

  def notifications
    notices.each do |notice|
      p notice
    end
  end

  def mark_as_read!
    notices.clear
    read_notification_from_file(student_filename)
  end

  def homeworks
    homeworks_todo.each(&:description)
  end

  def to_work!(homework)
    homeworks_in_progress.push(homework)
    message = "Student: #{presentation} started homework #{homework.title}"
    homework.mentor.notices.push(message)
    add_notification_to_file(student_filename, message)
  end

  def add_answer!(homework, answer)
    homework.answers.push(answer)
    homeworks_todo.delete(homework)
    homeworks_in_progress.push(homework)
    add_notification_to_file(student_filename, "#{answer} was added to homework #{homework.title}")
  end

  def to_check!(homework)
    homework.mentor.homeworks_for_check.push(homework)
    homeworks_todo.delete(homework)
    message = "Student: #{presentation} finished homework #{homework.title}"
    homework.mentor.notices.push(message)
    add_notification_to_file(student_filename, message)
  end

  def presentation
    "#{name} #{surname}"
  end

  def read_notification_from_file(filename)
    File.read(filename)
  end

  def add_notification_to_file(filename, notification)
    File.open(filename, 'a') do |f|
      f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} #{notification}\n")
    end
  end
end
