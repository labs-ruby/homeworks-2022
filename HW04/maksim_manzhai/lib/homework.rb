# frozen_string_literal: true

class Homework
  attr_reader :title, :mentor, :student
  attr_accessor :answers, :acceptable

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answers = []
    @acceptable = false
  end
end
