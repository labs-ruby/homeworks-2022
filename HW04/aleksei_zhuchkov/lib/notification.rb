# frozen_string_literal: true

class Notification
  attr_reader :title, :description

  def initialize(title = 'None', description = 'None')
    @title = title
    @description = description
  end

  def print_notification_for_students_and_mentor(name, surname, notifications, type_person)
    return 'None notification' if notifications.empty?

    if type_person == 'mentor'
      print_notification_for_mentor(name, surname, notifications)
    else
      print_notification_for_student(name, surname, notifications)
    end
    puts '====================='
  end

  def print_notification_for_mentor(name, surname, notifications)
    puts "Notification for mentor (#{name} #{surname})"
    notifications.each do |student|
      puts "Students: #{student.name} #{student.surname}"
      student.storage_notification_for_mentor.each(&:print_notification)
      puts "\n"
    end
  end

  def print_notification_for_student(name, surname, notifications)
    puts "Notification for student (#{name} #{surname}):"
    notifications.each(&:print_notification)
  end

  def print_notification
    puts "Title: #{title}, discription: #{description}"
  end
end
