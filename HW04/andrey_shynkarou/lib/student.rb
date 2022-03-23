# frozen_string_literal: true

require_relative './person'
require_relative './notification'

class Student < Person
  def notifications
    read_file('notification.txt')
  end

  def mark_as_read!
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "#{name} #{surname} left message: #{@notification.mark_as_read!}.\n")
  end

  def homeworks
    read_file('homework.txt')
  end

  def to_work!(homework)
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{homework.title} #{@notification.to_work!}.\n")
  end

  def add_answer!(homework, answer)
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "#{name} #{surname} #{@notification.add_answer!} for #{homework.title}. Answer is #{answer}.\n")
  end

  def to_check!(homework)
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "#{name} #{surname} left message #{homework.title} #{@notification.to_check!}.\n")
  end
end
