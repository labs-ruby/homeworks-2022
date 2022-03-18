# frozen_string_literal: true

class Student
  attr_accessor :notifications, :homeworks

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @surname = attributes.fetch(:surname)
    @notifications = []
    @homeworks = []
  end

  def mark_as_read!
    @notifications.each { |notification| notification.readed = true }
  end

  def to_work!(homework)
    @homeworks << homework
    homework.mentor.notifications << Notification.new(title: homework.title, description: 'Homework started')
  end
end
