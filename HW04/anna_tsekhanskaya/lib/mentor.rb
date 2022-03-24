# frozen_string_literal: true

require 'time'

class Mentor
  atter_accessor :name, :surname, :noties_for_student
  def initialize
    @name = name
    @surname = surname
    @noties_for_student = []
    @list_students = []
    @hw = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # mentor add new homework
  def add_homework(title, description, student)
    noties_for_student << Notification.new(title: title,
                                           description: "#{mentor.full_name} added hw at #{Time.now}", student: student)
    hw << Homework.new(title: title, description: description, student: Student.full_name, mentor: Mentor.full_name)
  end

  # mentor subscribe to student
  def subscribe_to
    list_students << Student.full_name
  end

  # mentor see notification about homework to work
  # mentor see notification about homework to check
  def notifications
    
  end

  # mentor mark as read all notifications
  def mark_as_read
    noties_for_student << Notification.new(title: 'Mark as read',
                                          description: "Mentor #{Mentor.full_name} mark as read at #{Time.now}")
  end


# mentor reject homework
  def reject_to_work(_homework)
    noties_for_student << Notification.new(title: 'Reject',
                                           description: "Mentor #{Mentor.full_name} reject homework at #{Time.now}")
  end

  # mentor accept homework
  def accept
    noties_for_student << Notification.new(title: 'Accept homework',
                                           description: "Mentor #{Mentor.full_name} accept homework at #{Time.now}")
  end
end