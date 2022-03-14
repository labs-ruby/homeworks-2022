# frozen_string_literal: true

require_relative '../lib/notification'
require_relative '../lib/participants'

class Student < Participants
  def to_work!(homework)
    add_notification_to_file_for_student(filename_for_add_notification, "Taked to work #{homework
    .title} \"#{homework.description}\" (#{name} #{surname})")
  end

  def homeworks
    read_notification_file("#{name}_#{surname}_homework.txt")
  end

  def add_answer!(homework, answer)
    add_new_file("#{name}_#{surname}_answer.txt", "Answer #{homework.title} \"#{homework.description}\" => #{answer}")
  end

  def to_check!(homework)
    add_notification_to_file_for_student(filename_for_add_notification, "Sent to check #{homework
    .title} \"#{homework.description}\" (#{name} #{surname})")
  end

end
