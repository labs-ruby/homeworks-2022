# frozen_string_literal: true

require_relative 'lib/person'

class Mentor < Person

  def notifications(notification_filename)
    read_file(notification_filename)
  end

  def add_homework(title:, description:, student:)
    Homework.new(title: title, description: description, student: student)
  end

end