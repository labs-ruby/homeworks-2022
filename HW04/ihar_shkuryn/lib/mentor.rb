# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :self
  attr_accessor :notices, :all_homeworks, :homeworks_for_check

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @subscriptions = []
    @notices = []
    @all_homeworks = []
    @homeworks_for_check = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description, student, self, 'new')
    homework.message = "Student #{student.presentation} got a new homework "\
    "from #{presentation} title: #{@title}"
    all_homeworks.push(homework)
    student.homeworks_todo.push(homework)
    notice_handler(homework, student)
    homework
  end

  def notice_handler(homework, student)
    notice = Notification.new(homework.title)
    student.notices.push(notice)
  end

  def subscribe_to!(student)
    @subscriptions.push(student)
    student.notices.push("Mentor #{presentation} subscribed to #{student.presentation}")
  end

  def notifications
    @notices.each do |notice|
      notice
    end
  end

  def mark_as_read!
    notices.clear
  end

  def reject_to_work!(homework)
    homework.student.homeworks_todo.push(homework)
    homeworks_for_check.delete(homework)
    homework.student.notices.push("Mentor #{presentation} rejected homework #{homework.title}")
  end

  def accept!(homework)
    homeworks_for_check.delete(homework)
    homework.student.homeworks_in_progress.delete(homework)
    homework.student.notices.push("Mentor #{presentation} accepted homework #{homework.title}")
  end

  def get_student_filename(student)
    "#{student.presentation}_notifications.txt"
  end

  def presentation
    "#{name} #{surname}"
  end
  
end
