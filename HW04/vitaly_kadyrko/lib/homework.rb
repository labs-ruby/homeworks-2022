# frozen_string_literal: true

class Homework
  attr_accessor :status
  attr_reader :title, :description, :student, :mentor, :answers

  def initialize(title:, description:, student:, mentor:, status: 'Created')
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @status = status
    @answers = []
  end

  def notify_mentor(notification)
    mentor.notifications << notification
  end

  def notify_student(notification)
    student.notifications << notification
  end
end
