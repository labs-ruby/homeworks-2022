# frozen_string_literal: true

class Mentor < Person
  def add_homework(title:, description:, student:)
    input_hw(student_homeworks(student), add_hw(description))
    notification_for_mentor(self, title)
    # notification_for_student(student,notification(title))
    Homework.new(title: title, description: description, student: student)
  end

  def subscribe_to!(student)
    notification_for_student(student, notification("#{name} #{surname} subscribe to you!"))
  end

  def mark_as_read!
    notification_for_mentor(self, read_all)
  end

  def reject_to_work!(student, homework)
    notification_for_student(student,
                             notification("#{name} #{surname} answer for #{homework.title} is wrong."))
  end

  def accept!(student, homework)
    notification_for_student(student,
                             notification("#{name} #{surname} answer for #{homework.title} is right!"))
  end
end
