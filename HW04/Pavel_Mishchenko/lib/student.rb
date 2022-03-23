# frozen_string_literal: true

class Student
  include MentorNotificator
  attr_reader :name, :surname
  attr_accessor :homeworks_list, :notifications_list

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks_list = []
    @notifications_list = []
  end

  def homeworks
    Presenter.print_homeworks(homeworks_list.select { |hw| hw.accepted == false })
  end

  def mark_as_read!
    notifications_list.each { |notification| notification.status = 'read' }
  end

  def to_work!(homework)
    homeworks_list.push(homework)
    notify_mentor(homework.mentor, "I'm working on #{homework.title}")
  end

  def add_answer!(homework, answer)
    homework.answer = answer
    notify_mentor(homework.mentor, "Add answer to #{homework.title}")
  end

  def to_check!(homework)
    notify_mentor(homework.mentor, "Check my #{homework.title}!")
  end

  def notifications
    unread_notifications = notifications_list.select { |notification| notification.status == 'unread' }
    puts '0 notification to read' if unread_notifications.empty?
    Presenter.print_notifications(unread_notifications)
  end
end
