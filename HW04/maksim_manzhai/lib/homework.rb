# frozen_string_literal: true

class Homework
  attr_reader :title, :mentor, :student
  attr_accessor :answers, :acceptable

  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    send_notification_to_student
    @answers = []
    @acceptable = false
  end

  def send_notification_to_student
    @student.notifications << Notification.new(title: @title, description: @description)
  end
end
