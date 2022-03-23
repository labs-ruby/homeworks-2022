# frozen_string_literal: true

class Mentor < Person
  def add_homework(title:, description:, student:)
    hw = Homework.new(title: title, description: description, student: student)
    student.homeworks << hw.description
    student.notifications << push_homework(title)
    hw
  end

  def subscribe_to!(student)
    student.notifications.clear if check_for_active_notifications(student)
    student.notifications << subscribe_to(self)
  end

  def mark_as_read!
    notifications.clear
    notifications <<  read_all_notifications(self)
  end

  def reject_to_work!(student, homework)
    student.notifications.clear if check_for_active_notifications(student)
    student.notifications << homework_reject(homework)
  end

  def accept!(student, homework)
    student.notifications.clear if check_for_active_notifications(student)
    student.notifications.delete(homework_reject(homework))
    student.notifications << homework_accept(homework)
  end
end
