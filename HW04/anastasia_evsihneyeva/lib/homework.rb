# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor
  attr_accessor :notification_s, :answers

  def initialize(data, mentor)
    @title = data[:title]
    @description = data[:description]
    @student = data[:student]
    @mentor = mentor
    data[:student].notification_s.logs << ("Homework #{@title} was added to #{@student.name} by mentor #{@mentor.name}")
    @answers = []
  end
end
