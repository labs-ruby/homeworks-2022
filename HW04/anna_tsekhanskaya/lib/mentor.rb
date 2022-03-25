# frozen_string_literal: true

require 'time'

class Mentor
  attr_reader :name, :surname, :notifications, :homeworks
  attr_accessor :student

  def initialize
    @name = name
    @surname = surname
    @notifications = []
    @list_students = []
    @homeworks = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # mentor add new homework
  def add_homework(title, description, student)
    notifications << Notification.new(title: title,
                                      description: "#{mentor.full_name} added hw at #{Time.now}", student: student)
    homeworks << Homework.new(title: title, description: description, student: Student.full_name,
                              mentor: Mentor.full_name)
  end

  # mentor subscribe to student
  def subscribe_to
    list_students << Student.full_name
  end

  # mentor see notification about homework to work
  # mentor see notification about homework to check
  # def notifications
  #  notifications.clear
  #  Notification.mark_as_read = true
  # end

  # mentor mark as read all notifications
  def mark_as_read
    Notification.mark_as_read = true
    notifications.clear
  end

  # mentor reject homework
  def reject_to_work(_homework)
    student.notifications << Notification.new(title: 'Reject',
                                              description: "Mentor #{Mentor.full_name} reject homework at #{Time.now}")
  end

  # mentor accept homework
  def accept
    notifications << Notification.new(title: 'Accept homework',
                                      description: "Mentor #{Mentor.full_name} accept homework at #{Time.now}")
  end
end
