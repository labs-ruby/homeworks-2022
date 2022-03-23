# frozen_string_literal: true

require 'time'

class Mentor
  atter_accessor :name, :surname, :noties_for_student
  def initialize
    @name = name
    @surname = surname
    @noties_for_student = []
  end

  def full_name
    "#{name.capitalize} #{surname.capitalize}"
  end

  # mentor add new homework
  def add_homework(_title, _description, student)
    noties_for_student << Notification.new(title: 'Add homework',
                                           description: "#{mentor.full_name} added hw at #{Time.now}", student: student)
  end

  def notifications
    puts noties_for_student.last
  end

  def subscribe_to; end

  def accept
    noties_for_student << Notification.new(title: 'Accept homework',
                                           description: "Mentor #{mentor.full_name} accept homework at #{Time.now}")
  end
end
