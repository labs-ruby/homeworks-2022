# frozen_string_literal: true

class Mentor
  attr_accessor :storage_students
  attr_reader :name, :surname

  def initialize(mentor)
    @name = mentor[:name].capitalize
    @surname = mentor[:surname].capitalize
    @storage_students = []
  end

  def add_homework(info_homework)
    homework = Homework.new(info_homework[:title], info_homework[:description], info_homework[:student])
    info_homework[:student].add_homework_to_student_storage(homework)
    info_homework[:student].storage_notification_for_student << Notification.new('Add homework', homework.title)
    homework
  end

  def subscribe_to!(student)
    @storage_students << student
  end

  def notifications
    return 'None notification' if @storage_students.empty?

    puts "Notification for mentor (#{name} #{surname})"
    @storage_students.each do |student|
      puts "Students: #{student.name} #{student.surname}"
      student.storage_notification_for_mentor.each { |el| puts "Title: #{el.title}, discription: #{el.description}" }
      puts "\n"
    end
    puts '-----------------------------'
  end

  def mark_as_read!
    @storage_students.each { |student| student.storage_notification_for_mentor.clear }
  end

  def reject_to_work!(homework)
    homework.homework_ready_for_check = false
    homework.student.storage_notification_for_student << Notification.new('Reject homework', homework.title)
  end

  def accept!(homework)
    homework.homework_accept_by_mentor = true
    homework.student.storage_notification_for_student << Notification.new('Accept', homework.title)
  end
end
