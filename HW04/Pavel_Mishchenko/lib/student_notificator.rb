# frozen_string_literal: true

module StudentNotificator
  def initialize
    @students_list = []
  end

  def subscribe_to!(student)
    @students_list.push(student)
  end

  def unsubscribe_to!(student)
    @students_list.delete(student)
  end

  def notify_student(student, description)
    student.notifications_list.push(Notification.new(
                                      title: "From #{@surname} to #{student.surname}",
                                      description: description
                                    ))
  end
end
