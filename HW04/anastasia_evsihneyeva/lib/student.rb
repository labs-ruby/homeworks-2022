# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :all_hw, :hw_in_progress, :notification_list

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @all_hw = []
    @notification_list = []
  end

  def notifications
    notification_list.each(&:output)
  end

  def notify(notification, mentor)
    mentor.notification_list << notification
  end

  def mark_as_read!
    notification_list.clear
  end

  def homeworks
    all_hw
  end

  def to_work!(homework)
    homework.status = 'In progress'
    all_hw << homework
    notify(Notification.new("Student #{name} work on #{homework.title}"), homework.mentor)
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    homework.status = 'To check'
    notify(Notification.new("Student #{name} added homework #{homework.title} to check"), homework.mentor)
  end
end
