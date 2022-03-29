# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :subscriptions, :self
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
    student.add_notification_to_file(student.student_filename,
                                     "Homework #{title} was assigned to #{student.presentation}")
    homework
  end

  def notice_handler(homework, student)
    notice = Notification.new(homework.title)
    student.notices.push(notice)
  end

  def subscribe_to!(student)
    return if subscriptions.include?(student)

    subscriptions.push(student)
    message = "Mentor #{presentation} subscribed to #{student.presentation}"
    notify_student(student, message)
    student.add_notification_to_file(student.student_filename, message)
  end

  def notify_student(student, message)
    notice = Notification.new(message)
    student.notices.push(notice)
  end

  def notifications
    notices.each do |notice|
      p notice
    end
  end

  def mark_as_read!
    notices.clear
  end

  def reject_to_work!(homework)
    student = homework.student
    student.homeworks_todo.push(homework)
    homeworks_for_check.delete(homework)
    message = "Mentor #{presentation} rejected homework #{homework.title}"
    student.notices.push(message)
    student.add_notification_to_file(student.student_filename, message)
  end

  def accept!(homework)
    student = homework.student
    homeworks_for_check.delete(homework)
    student.homeworks_in_progress.delete(homework)
    message = "Mentor #{presentation} accepted homework #{homework.title}"
    student.notices.push(message)
    student.add_notification_to_file(student.student_filename, message)
  end

  def presentation
    "#{name} #{surname}"
  end
end
