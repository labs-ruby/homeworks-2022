# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor
  attr_accessor :answer, :is_accept, :is_reject, :is_check

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answer = ''
    @is_accept = false
    @is_reject = false
    @is_check = false
  end
end
