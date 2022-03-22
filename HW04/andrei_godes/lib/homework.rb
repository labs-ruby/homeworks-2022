# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor, :answers
  attr_accessor :status

  def initialize(title:, description:, student:, mentor:, status: 'unchecked')
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @status = status
    @answers = []
  end
end
