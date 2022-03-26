# frozen_string_literal: true

class Student
  attr_accessor :notifications, :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
  end

  def mark_as_read!
    notifications.each { |notification| notification.readed = true }
  end

  def to_work!(homework)
    homework.mentor.notifications << Notification.new(title: homework.title, description: 'Homework started')
    homeworks << homework
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    homework.mentor.notifications << Notification.new(title: homework.title, description: 'Homework finished')
  end
end
