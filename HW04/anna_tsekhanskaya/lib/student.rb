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
  # student see notification about homework was reject
  # student see notification about homework was accept
  def notifications
    puts Mentor.notifications
  end

  # student mark as read all notifications
  def mark_as_read
    noties_for_mentor << Notification.new(title: 'Mark as read',
                                          description: "Student #{Student.full_name} mark as read at #{Time.now}")
  end

  # student can see homeworks
  def homeworks
    puts Homework.new
  end

  # student take to work homework [1]
  def to_work(homework)
    noties_for_mentor << Notification.new(title: 'Working',
                                          description: "Student #{Student.full_name} starts working at #{Time.now}")
    answer << homework
  end

  # student add answer to homework
  def add_answer(homework, str)
    noties_for_mentor << Notification.new(title: str,
                                          description: "Student #{Student.full_name} added answer at #{Time.now}")
    answer << homework
  end

  # student sent to check homework
  def to_check
    noties_for_mentor << Notification.new(title: 'Add answer',
                                          description: "Student ##{Student.full_name} sent hw to check #{Time.now}")
  end
end
