# frozen_string_literal: true

class Homework
  attr_accessor :status_homework, :storage_homework_answer
  attr_reader :title, :description, :student, :mentor

  def initialize(title, description, student, mentor)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @storage_homework_answer = []
    @status_homework = 'begin'
  end

  def print_homework
    puts "Task: #{title}, discription: #{description}"
    puts '-----------------------------'
    [title, description]
  end
end
