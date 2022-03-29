# frozen_string_literal: true

require_relative './notification'
require_relative './file_support'

class Mentor
  include FileSupport
  attr_reader :name, :surname, :notification

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notification = Notification.new
  end

  def notifications
    read_task_file('notification.txt')
  end

  def add_homework(title:, description:, student:)
    write_to_task_file('homework.txt',
                       "#{@notification.add_homework}#{title}, #{description}for #{student.name} #{student.surname}.\n")
    Homework.new(title: title, description: description, student: student)
  end

  def mark_as_read!
    notification_storage_empty('notification.txt')
  end

  def accept!(homework)
    write_to_task_file('notification.txt',
                       "Homework #{homework.title} #{homework.description} #{@notification.accept!}.\n")
  end

  def reject_to_work!(homework)
    write_to_task_file('notification.txt',
                       "Answer for #{homework.title} #{homework.description} #{@notification.reject_to_work!}.\n")
  end

  def subscribe_to!(student)
    write_to_task_file('notification.txt',
                       "Mentor #{name} #{surname} #{@notification.subscribe_to!} #{student.name} #{student.surname}.\n")
  end
end
