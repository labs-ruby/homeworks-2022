# frozen_string_literal: true

require 'time'

class Student
  attr_accessor :name, :surname, :notifications, :student, :list_homework, :answer
  attr_reader :mentor

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @answer = []
    @notifications = []
    @list_homework = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # student mark as read all notifications
  def mark_as_read!
    notifications.clear
  end

  # student can see homeworks
  def homeworks
    Homework.new(title: 'Continuation homework', description: answer, student: student,
                 mentor: mentor)
  end

  # student take to work homework
  def to_work!(homework)
    notifications << Notification.new(title: 'Working',
                                      description: "Student #{full_name} starts working at #{Time.now}")
    list_homework << Homework.new(title: '', description: answer, student: full_name, mentor: mentor.full_name)
    answer << homework
  end

  # student add answer to homework
  def add_answer(homework:, str:)
    notifications << Notification.new(title: str,
                                      description: "Student #{full_name} added answer at #{Time.now}")
    answer << homework
  end

  # student sent to check homework
  def to_check
    notifications << Notification.new(title: 'Add answer',
                                      description: "Student #{full_name} sent hw to check #{Time.now}")
  end
end
