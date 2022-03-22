# frozen_string_literal: true

class Homework
  attr_reader :title,:mentor , :student, :description
  attr_accessor :answers, :status

  def initialize(title:, description:, student:, mentor:, status: 'unchecked')
    @title = title
    @description = description
    @student = student
    @answers = []
    @mentor = mentor
    @status = status
    send_notify
  end

  def send_notify
    student.notifications << Notification.new(title: title, description: description)
  end
end
