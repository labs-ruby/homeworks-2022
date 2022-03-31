# frozen_string_literal: true

class Student
  attr_accessor :storage_homework, :notifications_list
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @storage_homework = []
    @notifications_list = []
  end

  def add_homework_to_student_storage(homework)
    storage_homework << homework
  end

  def notifications
    Notification.new.get_notifications(notifications_list)
  end

  def mark_as_read!
    notifications_list.clear
  end

  def homeworks
    storage_homework.each(&:print_homework)
  end

  def to_work!(homework)
    homework.status_homework = 'in work'
    homework.mentor.notifications_list << Notification.new('To work!', homework.title)
  end

  def add_answer!(homework, answer)
    homework.storage_homework_answer << answer
    homework.mentor.notifications_list << Notification.new('New answer!', homework.title)
  end

  def to_check!(homework)
    homework.status_homework = 'to check'
    homework.mentor.notifications_list << Notification.new('Ready to check!', homework.title)
  end
end
