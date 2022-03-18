# frozen_string_literal: true

class Homework
  attr_reader :title
  attr_accessor :mentor, :answers, :student

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)
    @student = attributes.fetch(:student)
    @mentor = attributes.fetch(:mentor)
    @student.notifications << Notification.new(title: @title, description: @description)
    @answers = []
  end
end
