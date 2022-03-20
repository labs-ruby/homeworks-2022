# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor
  attr_accessor :notification, :answers

  def initialize(data, mentor)
    @title = data[:title]
    @description = data[:description]
    @student = data[:student]
    @mentor = mentor
    @answers = []
  end
end
