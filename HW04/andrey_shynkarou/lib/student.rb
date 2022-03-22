# frozen_string_literal: true

require_relative 'lib/person'

class Student < Person
  def notifications(notification_filename)
    read_file(notification_filename)
  end

  def mark_as_read!
    f = File.open('notification.txt', 'a')
    f.write("Student #{name} #{surname} read all notifications")
    f.close
  end

  def homeworks(homeworks_filename)
    read_file(homeworks_filename)
  end

  private

end
