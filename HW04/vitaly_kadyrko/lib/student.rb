# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def notify_mentor(notification)
    mentor.notifications << notification
  end

  def mark_as_read!
    notifications.clear
  end

  def to_work!(homework)
    notification = Notification.new(homework: homework, text: :to_work).notification_messages
    notify_mentor(notification)
    homework.status = 'In progress'
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    notification = Notification.new(homework: homework, text: :to_check).notification_messages
    notify_mentor(notification)
    homework.status = 'Awaiting to check'
  end
end
