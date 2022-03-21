# frozen_string_literal: true

class Homework
  attr_reader :title, :description, :student, :mentor
  attr_accessor :notice, :answers

  def initialize(data, mentor)
    @title = data[:title]
    @description = data[:description]
    @student = data[:student]
    @mentor = mentor
    @status = data[:status]
    message = "Student #{@student.name} #{@student.surname} got a new homework "\
    "from #{@mentor.name} #{@mentor.surname} title: #{@title}"
    data[:student].notice.queue.push(message)
    answers = []
  end
end
