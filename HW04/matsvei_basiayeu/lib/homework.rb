# frozen_string_literal: true

# my class homework
class Homework
  attr_reader :title, :mentor, :student, :description
  attr_accessor :answers, :status

  def initialize(title:, description:, student:, mentor:, status: 'unchecked')
    @title = title
    @description = description
    @student = student
    @answers = []
    @mentor = mentor
    @status = status
  end
end
