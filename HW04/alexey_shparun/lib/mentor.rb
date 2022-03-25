# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname
  attr_accessor :notifications_list, :student_list

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications_list = []
    @student_list = []
  end

  def notify_student(notification)
    notifications_list.push(notification)
  end

  def subscribe_to!(student)
    student_list.push(student)
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description, student, mentor: self)
    notification = Notification.new("Add new homework: #{homework.title}")
    notify_student(notification)
    student.homeworks_list.push(homework)
    homework
  end

  def mark_as_read!
    notifications_list.clear
  end

  def reject_to_work!(homework)
    notification = Notification.new("Reject homework: #{homework.title}")
    homework.student.notify_mentor(notification)
  end

  def accept!(homework)
    notification = Notification.new("#{homework.title} accepted")
    homework.student.notify_mentor(notification)
  end
end
