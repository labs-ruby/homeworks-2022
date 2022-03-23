# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :subscriptions, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @notifications = []
  end

  def notify_student(notification)
    student.notifications << notification
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student, mentor: self)
    notification = Notification.new(homework: homework, text: :new_homework).notification_messages

    student.homeworks << homework
    notify_student(notification)

    homework
  end

  def subscribe_to!(student)
    subscriptions << student
  end

  def mark_as_read!
    notifications.clear
  end

  def reject_to_work!(homework)
    notification = Notification.new(homework: homework, text: :reject_work).notification_messages
    notify_student(notification)
    homework.status = 'Rejected'
  end

  def accept!(homework)
    notification = Notification.new(homework: homework, text: :accept_work).notification_messages
    notify_student(notification)
    homework.status = 'Accepted'
  end
end
