# frozen_string_literal: true

require_relative './notification'
require_relative './file_support'

class Student
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

  def mark_as_read!
    notification_storage_empty('notification.txt')
  end

  def homeworks
    read_task_file('homework.txt')
  end

  def to_work!(homework)
    write_to_task_file('notification.txt',
                       "#{name} #{surname} left message #{homework.title} #{@notification.to_work!}.\n")
  end

  def add_answer!(homework, answer)
    write_to_task_file('notification.txt',
                       "#{name} #{surname} #{@notification.add_answer!} for #{homework.title}. Answer is #{answer}.\n")
  end

  def to_check!(homework)
    write_to_task_file('notification.txt',
                       "#{name} #{surname} left message #{homework.title} #{@notification.to_check!}.\n")
  end
end
