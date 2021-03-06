# frozen_string_literal: true

require 'time'

class Student
  attr_accessor :homeworks, :notifications, :answers
  attr_reader :name, :surname, :mentor, :student

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
    @anwers = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # student mark as read all notifications
  def mark_as_read!
    notifications.clear
  end

  # student take to work homework
  def to_work!(homework)
    homeworks << homework
    notifications << Notification.new(title: 'Working',
                                      description: "Student #{full_name} starts working at #{Time.now}")
  end

  # student add answer to homework
  def add_answer!(homework, answer)
    answers << answer
    notifications << Notification.new(title: "Added answer #{homework.title}",
                                      description: "Student #{full_name} added answer at #{Time.now}")
    answers
  end

  # student sent to check homework
  def to_check!(homework)
    homeworks << homework
    notifications << Notification.new(title: "#{homework.title} ready for checking",
                                      description: "Student #{full_name} sent homework to check #{Time.now}")
  end
end
