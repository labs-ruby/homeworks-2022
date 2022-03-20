# frozen_string_literal: true

class Homework
  attr_reader :title
  attr_accessor :mentor, :answers, :student, :acceptable

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @student.notifications << Notification.new(title: @title, description: @description)
    @answers = []
    @acceptable = false
  end
end
