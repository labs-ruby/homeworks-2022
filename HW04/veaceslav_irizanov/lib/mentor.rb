# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :notifications, :subscriptions

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @notifications = []
  end

  def notify_student(notification, student)
    student.notifications << notification
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student, mentor: self)
    notification = Notification.new("Add new Homework: #{homework.title}")

    student.homeworks << homework
    notify_student(notification, homework.student)
  end

  def subscribe_to!(student)
    subscriptions << student
  end

  def mark_as_read!
    notifications.clear
  end

  def reject_to_work!(homework); end

  def accept!(homework); end
end