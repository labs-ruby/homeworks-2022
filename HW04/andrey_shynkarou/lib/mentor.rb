# frozen_string_literal: true

require_relative './person'
require_relative './notification'

class Mentor < Person
  def notifications
    read_file('notification.txt')
  end

  def add_homework(title:, description:, student:)
    write_to_file('homework.txt',
                  "Homework #{title}, description #{description}\n
                  for #{student.name} #{student.surname}")
    Homework.new(title: title, description: description, student: student)
  end

  def mark_as_read!
    write_to_file('notification.txt',
                  "Mentor #{name} #{surname} read notifications.\n")
  end

  def accept!(homework)
    write_to_file('notification.txt',
                  "Homework #{homework.title} #{homework.description} is accepted.\n")
  end

  def reject_to_work!(homework)
    write_to_file('notification.txt',
                  "Answer for #{homework.title} #{homework.description} is rejected.\n")
  end

  def subscribe_to!(student)
    write_to_file('notification.txt',
                  "Mentor #{name} #{surname} is subscribed to #{student.name} #{student.surname}.\n")
  end
end
