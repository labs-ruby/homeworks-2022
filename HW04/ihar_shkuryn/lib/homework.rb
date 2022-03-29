# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor
  attr_accessor :notices, :answers, :message

  def initialize(title, description, student, mentor, status)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @status = status
    @answers = []
  end
end
