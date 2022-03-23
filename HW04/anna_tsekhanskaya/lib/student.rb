# frozen_string_literal: true

require 'time'

class Student
  atter_accessor :name, :surna
  atter_reader :noties
  def initialize
    @name = name
    @surname = surname
    @answer = []
    @noties_for_mentor = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # student see notification about new homework
  def notifications; end

  # student take to work homework
  def homeworks
    answer << homework
  end

  # student mark as read all notifications
  def mark_as_read
    noties_for_mentor << Notification.new(title: 'Mark as read',
                                          description: "Student #{student.full_name} mark as read at #{Time.now}")
  end

  def to_work(homework)
    noties_for_mentor << Notification.new(title: 'Working',
                                          description: "Student #{student.full_name} starts working at #{Time.now}")
    answer << homework
  end

  def add_answer(homework, str)
    noties_for_mentor << str
    noties_for_mentor << Notification.new(title: 'Add answer',
                                          description: "Student #{student.full_name} added answer at #{Time.now}")
    answer << homework
  end

  def to_check
    noties_for_mentor << Notification.new(title: 'Add answer',
                                          description: "Student ##{student.full_name} sent hw to check #{Time.now}")
  end
end
