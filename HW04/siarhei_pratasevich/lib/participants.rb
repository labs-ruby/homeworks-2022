# frozen_string_literal: true

class Participants
  include Notification
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  def notifications(student = (no_argument = true))
    if no_argument
      read_notification_file(filename_for_add_notification)
    else
      read_notification_file(filename_for_add_notification(student))
    end
  end

  def mark_as_read!(student = (no_argument = true))
    if no_argument
      add_notification_to_file_for_student(filename_for_add_notification,
                                           "Read all notifications (#{name} #{surname})")
    else
      add_notification_to_file_for_mentor(filename_for_add_notification(student),
                                          "Read all notifications (#{name} #{surname})")
    end
  end

  private

  def filename_for_add_notification(student = (no_argument = true))
    if no_argument
      "#{name}_#{surname}_notifications.txt"
    else
      "#{student.name}_#{student.surname}_notifications.txt"
    end
  end
end
