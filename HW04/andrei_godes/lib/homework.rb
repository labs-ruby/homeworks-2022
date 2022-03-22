# frozen_string_literal: true

class Homework
  attr_reader :title, :description, student:

  def initialize(title:, description:, student:)
    @title = title
    @description = description
    @student = student
  end
end
