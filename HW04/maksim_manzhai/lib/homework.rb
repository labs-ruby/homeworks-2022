# frozen_string_literal: true

class Homework
  def initialize(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)
    @student = attributes.fetch(:student)
    @student.notifications << Notification.new(title: @title, description: @description)
  end
end
