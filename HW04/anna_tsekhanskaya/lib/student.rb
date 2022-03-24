# frozen_string_literal: true

require 'time'

class Student
  atter_accessor :name, :surname, :noties_for_mentor
  def initialize
    @name = name
    @surname = surname
    @answer = []
    @noties_for_mentor = []
    @list_homework = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # student see notification about new homework
  # student see notification about homework was reject
  # student see notification about homework was accept
  def notifications
    noties_for_mentor.clear
  end

  # student mark as read all notifications
  def mark_as_read
    noties_for_mentor.clear
    Notification.mark_as_read = true
  end

  # student can see homeworks
  def homeworks
    Homework.new(title: 'Continuation homework', description: answer, student: Student.full_name,
                 mentor: Mentor.full_name)
  end

  # student take to work homework
  def to_work(homework)
    noties_for_mentor << Notification.new(title: 'Working',
                                          description: "Student #{Student.full_name} starts working at #{Time.now}")
    list_homework << Homework.new(title: '', description: answer, student: Student.full_name, mentor: Mentor.full_name)
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
                                          description: "Student #{Student.full_name} sent hw to check #{Time.now}")
  end
end
