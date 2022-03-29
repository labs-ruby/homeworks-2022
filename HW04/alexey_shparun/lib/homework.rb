# frozen_string_literal: true

class Homework
  attr_accessor :answer_list
  attr_reader :title, :description, :student, :mentor, :answers

  def initialize(title, description, student, mentor)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answer_list = []
  end
end
