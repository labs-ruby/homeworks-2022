# frozen_string_literal: true

require_relative '../lib/notification'
require_relative '../lib/person'

class Student < Person
  def mark_as_read!
    notifications.clear
    notifications <<  read_all_notifications(self)
  end

  def to_work!(mentor, homework)
    mentor.notifications << status_to_work(self, homework)
    homeworks << ' <- in progress'
  end

  def add_answer!(homework, answer)
    homework.answers << answer.to_s
  end

  def to_check!(mentor, homework)
    mentor.notifications.clear if active_notifications_present?(mentor)
    mentor.notifications << status_to_check(self, homework)
  end
end
