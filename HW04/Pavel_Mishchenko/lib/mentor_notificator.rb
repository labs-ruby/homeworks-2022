# frozen_string_literal: true

module MentorNotificator
  def notify_mentor(mentor, description)
    mentor.notifications_list.push(Notification.new(
                                     title: "From #{@surname} to #{mentor.surname}", description: description
                                   ))
  end
end
