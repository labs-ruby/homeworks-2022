# frozen_string_literal: true

class Mentor
  attr_accessor :subscriptions, :notifications

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @surname = attributes.fetch(:surname)
    @subscriptions = []
    @notifications = []
  end

  def add_homework(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)
    @student = attributes.fetch(:student)
    @mentor = attributes.fetch(:mentor)
    Homework.new(title: @title, description: @description, student: @student, mentor: @mentor)
  end

  def subscribe_to!(student)
    @subscriptions << student
  end

  def mark_as_read!
    @notifications.each { |notification| notification.readed = true }
  end

  def reject_to_work!(homework)
    homework.student.notifications << Notification.new(title: homework.title, description: 'Your homework rejected')
  end
end
