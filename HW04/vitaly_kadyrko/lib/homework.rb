# frozen_string_literal: true

class Homework
  attr_accessor :status
  attr_reader :title, :description, :student, :mentor, :answers

  def initialize(title:, description:, student:, mentor:, status: 'Created')
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @status = status
    @answers = []
  end
end
