# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def mark_as_read!
    notifications.clear
  end

  def to_work!(homework)
    notification = Notification.new("Homework: #{homework.title} in progress")
    homework.status = 'in progress'
    notify_mentor(notification, homework.mentor)
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    notification = Notification.new("Homework: #{homework.title} ready to check")
    homework.status = 'ready to check'
    notify_mentor(notification, homework.mentor)
  end

  private

  def notify_mentor(notification, mentor)
    mentor.notifications << notification
  end
end
