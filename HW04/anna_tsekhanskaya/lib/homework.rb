# frozen_string_literal: true

class Homework
  attr_reader :student, :mentor, :title

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
  end
end
