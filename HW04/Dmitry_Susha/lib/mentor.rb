# frozen_string_literal: true

require_relative 'user'
class Mentor < User
  def add_homework(title:, description:, student:)
    Homework.new(title: title, description: description, student: student)
  end

  def invite_student_to_work(homework)
    add_notification(homework.student, "You have new homework: #{homework.title}")
  end

  def subscribe_to!(homework)
    homework.add_mentor_observer(self)
  end

  def reject_to_work!(homework, remarks = '')
    homework.reject!(self, remarks)
  end

  def accept!(homework, grade = 5)
    homework.accept!(grade)
  end

  def update(homework)
    notification_message = "#{homework.student.name} #{homework.student.surname} #{homework.title} - #{homework.state}"
    add_notification(self, notification_message)
  end
end
