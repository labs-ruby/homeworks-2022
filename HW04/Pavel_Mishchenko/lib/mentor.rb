# frozen_string_literal: true

class Mentor
  include StudentNotificator
  attr_reader :name, :surname
  attr_accessor :notifications_list

  def initialize(name:, surname:)
    super()
    @name = name
    @surname = surname
    @notifications_list = []
  end

  def add_homework(homework_parameters)
    new_homework = Homework.new(title: homework_parameters[:title],
                                description: homework_parameters[:description],
                                student: homework_parameters[:student],
                                mentor: self)
    notify_student(homework_parameters[:student], "New homework! #{homework_parameters[:title]}")
    new_homework
  end

  def mark_as_read!
    notifications_list.each { |notification| notification.status = 'read' }
  end

  def reject_to_work!(homework)
    notify_student(homework.student, 'Homework is rejected!')
  end

  def accept!(homework)
    homework.accepted = true
    notify_student(homework.student, 'Your homework is accepted! Good job!')
  end

  def notifications
    unread_notifications = notifications_list.select { |notification| notification.status == 'unread' }
    puts '0 notification to read' if unread_notifications.empty?
    CLI.print_notifications(unread_notifications)
  end
end
