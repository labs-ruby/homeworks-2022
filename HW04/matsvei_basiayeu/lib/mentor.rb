# frozen_string_literal: true

# my class mentor
class Mentor
  attr_reader :name, :surname, :subscriptions, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @notifications = []
  end

  def add_homework(title:, description:, student:)
    student.notifications << Notification.new(title: title, description: description)
    Homework.new(title: title, description: description, student: student, mentor: self)
  end

  def mark_as_read!
    @notifications.clear
  end

  def reject_to_work!(homework)
    homework.status = 'reject'
    homework.student.notifications << Notification.new(title: homework.title, description: 'Your homework reject')
  end

  def subscribe_to!(student)
    @subscriptions << student
  end

  def accept!(homework)
    homework.status = 'accept'
    homework.student.notifications << Notification.new(title: homework.title, description: 'Your homework accept')
  end
end
