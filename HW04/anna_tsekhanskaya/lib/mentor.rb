# frozen_string_literal: true

require 'time'

class Mentor
  attr_reader :homeworks, :name, :surname, :list_students
  attr_accessor :student

  def initialize(name:, surname:)
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
  def add_homework(title:, description:, student:)
    homeworks << Homework.new(title: title, description: description, student: student.full_name,
                              mentor: full_name)
    student.notifications << Notification.new(title: title,
                                              description: "#{full_name} added homework at #{Time.now}")
  end

  # mentor subscribe to student
  def subscribe_to!(student)
    list_students << student
  end

  # mentor mark as read all notifications
  def mark_as_read
    notifications.clear
  end

  # mentor reject homework
  def reject_to_work(*)
    notifications << Notification.new(title: 'Reject',
                                      description: "Mentor #{full_name} reject homework at #{Time.now}")
  end

  # mentor accept homework
  def accept
    notifications << Notification.new(title: 'Accept homework',
                                      description: "Mentor #{full_name} accept homework at #{Time.now}")
  end
end
