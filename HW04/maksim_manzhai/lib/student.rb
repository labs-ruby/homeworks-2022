# frozen_string_literal: true

class Student
  attr_accessor :notifications

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @surname = attributes.fetch(:surname)
    @notifications = []
  end

  def mark_as_read!
    @notifications.each { |notification| notification.readed = true }
  end
end
