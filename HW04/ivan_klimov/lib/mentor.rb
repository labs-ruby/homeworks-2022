# frozen_string_literal: true

class Mentor < Person
  def add_homework(title:, description:, student:)
    hw = Homework.new(title: title, description: description, student: student)
    student.homeworks << hw.description
    student.notifications << add_hw(title)
    hw
  end

  def subscribe_to!(student)
    student.notifications.clear if nf_is_empty(student)
    student.notifications << subscribe_to(self)
  end

  def mark_as_read!
    notifications.clear
    notifications << read_all(self)
  end

  def reject_to_work!(student, homework)
    student.notifications.clear if nf_is_empty(student)
    student.notifications << hw_reject(homework)
  end

  def accept!(student, homework)
    student.notifications.clear if nf_is_empty(student)
    student.notifications.delete(hw_reject(homework))
    student.notifications << hw_accept(homework)
  end
end
