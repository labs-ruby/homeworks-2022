# frozen_string_literal: true

module StudentNotificator
  def notify_student(student, description)
    student.notifications_list.push(Notification.new(
                                      title: "From #{@surname} to #{student.surname}",
                                      description: description
                                    ))
  end
end
