# frozen_string_literal: true

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

  def subscribe_to!(student)
    subscriptions << student
  end

  def mark_as_read!
    notifications.each { |notification| notification.readed = true }
  end

  def reject_to_work!(homework)
    homework.student.notifications << Notification.new(title: homework.title, description: 'Your homework rejected')
  end

  def accept!(homework)
    homework.acceptable = true
    homework.student.notifications << Notification.new(title: homework.title, description: 'Your homework accepted')
  end
end
