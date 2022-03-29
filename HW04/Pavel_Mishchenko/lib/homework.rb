# frozen_string_literal: true

class Homework
  attr_reader :title, :description
  attr_accessor :mentor, :answer, :student, :accepted

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @accepted = false
  end
end
