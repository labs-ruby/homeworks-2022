# frozen_string_literal: true

# my class student
class Student
  attr_accessor :notifications, :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
  end

  def mark_as_read!
    @notifications.clear
  end

  def to_work!(homework)
    @homeworks << homework
    homework.mentor.notifications << Notification.new(title: homework.title, description: 'I started my homework')
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def send_to_check!(homework)
    homework.mentor.notifications << Notification.new(title: homework.title, description: 'I finished my homework')
  end
end
