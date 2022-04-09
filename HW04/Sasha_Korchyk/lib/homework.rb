# frozen_string_literal: true

class Homework
  attr_reader :title, :mentor, :student, :description
  attr_accessor :accepted_by_mentor, :started_execution, :answer

  def initialize(title, description, student, mentor)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    @answer = ''

    @accepted_by_mentor = false
    @started_execution = false
  end

  def notify_add_homework
    student.all_notifications << Notification.new(@title, @description, 'hw', @mentor)
    student.all_homeworks << self
  end

  def notify_take_to_work
    mentor.all_notifications << Notification.new(@title, @description, 'tw', @student)
  end

  def notify_to_check
    mentor.all_notifications << Notification.new(@title, @description, 'tc', @student, @answer)
  end

  def notify_reject_to_work
    student.all_notifications <<  Notification.new(@title, @description, 'rw', @mentor, @answer)
  end

  def notify_accept
    student.all_notifications <<  Notification.new(@title, @description, 'aw', @mentor, @answer)
  end
end
