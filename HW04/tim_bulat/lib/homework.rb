# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor
  attr_accessor :answer, :status

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answer = ''
    @status = ''
  end
end
