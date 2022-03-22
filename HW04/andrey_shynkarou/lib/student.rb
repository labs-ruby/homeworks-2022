# frozen_string_literal: true

require_relative './person'
require_relative './notification'

class Student < Person
  include Notification
  def notifications
    read_file("#{name}_#{surname}_notification.txt")
  end

  def mark_as_read!
    write_to_file("#{name}_#{surname}_notification.txt", "Student #{name} #{surname} read all notifications.\n")
  end

  def homeworks
    read_file("#{name}_#{surname}_homework.txt")
  end

  def to_work!(homework)
    write_to_file("#{name}_#{surname}_notification.txt",
                  "Homework #{homework.title}, #{homework.description} is being done.\n")
  end

  def add_answer!(homework, answer)
    write_to_file("#{name}_#{surname}_notification.txt",
                  "Homework #{homework.title}, #{homework.description} has done. Answer is #{answer}.\n")
  end

  def to_check!(homework)
    write_to_file("#{name}_#{surname}_notification.txt",
                  "Please, check homework #{homework.title}, #{homework.description}.\n")
  end
end
