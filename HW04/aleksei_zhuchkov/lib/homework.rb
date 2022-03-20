# frozen_string_literal: true

class Homework
  attr_accessor :homework_in_work, :storage_homework_answer, :homework_ready_for_check, :homework_accept_by_mentor
  attr_reader :title, :description, :student

  def initialize(title, description, student)
    @title = title
    @description = description
    @student = student
    @storage_homework_answer = []
    @homework_in_work = false
    @homework_ready_for_check = false
    @homework_accept_by_mentor = false
  end
end
