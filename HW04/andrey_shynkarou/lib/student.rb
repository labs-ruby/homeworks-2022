# frozen_string_literal: true

require_relative './notification'

class Student
  attr_reader :name, :surname, :notification

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notification = Notification.new
  end

  def notifications
    read_file('notification.txt')
  end

  def mark_as_read!
    notification_storage_empty('notification.txt')
  end

  def homeworks
    read_file('homework.txt')
  end

  def to_work!(homework)
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{homework.title} #{@notification.to_work!}.\n")
  end

  def add_answer!(homework, answer)
    write_to_file('notification.txt',
                  "#{name} #{surname} #{@notification.add_answer!} for #{homework.title}. Answer is #{answer}.\n")
  end

  def to_check!(homework)
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{homework.title} #{@notification.to_check!}.\n")
  end

  private

  def read_file(filename)
    task_file = File.open(filename, 'r')
    task_file.each_line { |line| puts line }
    task_file.close
  end

  def write_to_file(filename, message)
    task_file = File.open(filename, 'w')
    task_file.write(message)
    task_file.close
  end

  def notification_storage_empty(filename)
    task_file = File.open(filename, 'w')
    task_file.close
  end
end
