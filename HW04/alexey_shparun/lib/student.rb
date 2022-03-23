# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :homeworks_list, :notifications_list

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications_list = []
    @homeworks_list = []
  end

  def notify_mentor(notification)
    notifications_list.push(notification)
  end

  def mark_as_read!
    notifications_list.clear
  end

  def to_work!(homework)
    notification = Notification.new("#{homework.title} taken to work")
    notify_mentor(notification)
  end

  def add_answer!(homework, answer)
    homework.answer_list.push(answer)
  end

  def to_check!(homework)
    notification = Notification.new("#{homework.title} ready for review")
    notify_mentor(notification)
  end

  def homeworks
    homeworks_list
  end
end
