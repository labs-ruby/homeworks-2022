# frozen_string_literal: true

class Mentor
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @surname = attributes.fetch(:surname)
  end

  def add_homework(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)
    @student = attributes.fetch(:student)
    Homework.new(title: @title, description: @description, student: @student)
  end
end
