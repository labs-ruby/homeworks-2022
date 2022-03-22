# frozen_string_literal: true

require_relative 'lib/person'

class Student < Person
  def notifications
    f = File.open('notification.txt', 'r')
    puts f.read
    f.close
  end
end