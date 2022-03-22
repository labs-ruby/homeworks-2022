# frozen_string_literal: true

require_relative './person'
require_relative './notification'

class Mentor < Person
  include Notification
  def notifications
    read_file("#{student.name}_#{student.surname}_notification.txt")
  end

  def add_homework(title:, description:, student:)
    Homework.new(title: title, description: description, student: student)
  end

  def mark_as_read!
    write_to_file("#{student.name}_#{student.surname}_notification.txt",
                  "Mentor #{name} #{surname} read notifications.\n")
  end

  def accept!(student, homework)
    write_to_file("#{student.name}_#{student.surname}_notification.txt",
                  "Homework #{homework.title} #{homework.description} is accepted.\n")
  end

  def reject_to_work!(homework)
    write_to_file("#{student.name}_#{student.surname}_notification.txt",
                  "Answer for #{homework.title} #{homework.description} is rejected.\n")
  end

  def subscribe_to!(student)
    write_to_file("#{student.name}_#{student.surname}_notification.txt",
                  "Mentor #{name} #{surname} is subscribed to you.\n")
  end
end
