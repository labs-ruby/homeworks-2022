# frozen_string_literal: true

class Mentor
  include Notification
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  def notifications(student)
    read_notification_file(filename_for_add_notification(student))
  end

  def mark_as_read!(student)
    add_notification_to_file_for_mentor(filename_for_add_notification(student),
                                        "Read all notifications (#{name} #{surname})")
  end

  def add_homework(title:, description:, student:)
    add_new_file(filename_for_add_notification(student),
                 "New homework: #{title} \"#{description}\" for #{student.name} #{student.surname}")
    add_new_file("#{student.name}_#{student.surname}_homework.txt",
                 "homework: #{title} \"#{description}\" for #{student.name} #{student.surname}")
    Homework.new(title: title, description: description, student: student)
  end

  def subscribe_to!(student)
    add_notification_to_file_for_mentor(filename_for_add_notification(student),
                                        "#{name} #{surname} subscribe to #{student.name}_#{student.surname}")
  end

  def reject_to_work!(homework, student)
    add_notification_to_file_for_mentor(filename_for_add_notification(student), "Wrong answer for #{homework
    .title} \"#{homework.description}\" (#{name} #{surname})")
  end

  def accept!(homework, student)
    add_notification_to_file_for_mentor(filename_for_add_notification(student), "Good job! #{homework
    .title} \"#{homework.description}\" - accepted! (#{name} #{surname})")
  end

  private

  def filename_for_add_notification(student)
    "#{student.name}_#{student.surname}_notifications.txt"
  end
end
