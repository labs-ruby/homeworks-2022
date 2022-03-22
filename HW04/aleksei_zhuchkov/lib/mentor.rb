# frozen_string_literal: true

class Mentor
  attr_accessor :students_list, :notifications_list
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name.capitalize
    @surname = surname.capitalize
    @students_list = []
    @notifications_list = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description, student, self)
    student.add_homework_to_student_storage(homework)
    student.notifications_list << Notification.new('Add homework', homework.title)
    homework
  end

  def subscribe_to!(student)
    students_list << student
  end

  def notifications
    Notification.new.print_notifications(notifications_list)
  end

  def mark_as_read!
    notifications_list.clear
  end

  def reject_to_work!(homework)
    homework.status_homework = 'rejected'
    homework.student.notifications_list << Notification.new('Reject homework', homework.title)
  end

  def accept!(homework)
    homework.status_homework = 'accepted'
    homework.student.notifications_list << Notification.new('Accept', homework.title)
  end
end
