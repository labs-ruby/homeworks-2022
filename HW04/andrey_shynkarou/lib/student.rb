# frozen_string_literal: true

require_relative './person'
require_relative './notification'

class Student < Person
  def notifications
    read_file('notification.txt')
  end

  def mark_as_read!
    notification = Notification.new('read all notifications')
    write_to_file('notification.txt', "#{name} #{surname} left message #{notification.message}.\n")
  end

  def homeworks
    read_file('homework.txt')
  end

  def to_work!(homework)
    notification = Notification.new("#{homework.title} is doing")
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{notification.message}.\n")
  end

  def add_answer!(homework, answer)
    notification = Notification.new("#{homework.title} was solved")
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{notification.message}. Answer is #{answer}.\n")
  end

  def to_check!(homework)
    notification = Notification.new("#{homework.title} needs to check")
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{notification.message}.\n")
  end

  private

  def read_file(filename)
    f = File.open(filename, 'r')
    f.each_line { |line| puts line }
    f.close
  end

  def write_to_file(filename, message)
    f = File.open(filename, 'w')
    f.write(message)
    f.close
  end
end
