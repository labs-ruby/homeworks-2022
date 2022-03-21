# frozen_string_literal: true

class Student
  attr_accessor :storage_homework, :storage_notification_for_student, :storage_notification_for_mentor
  attr_reader :name, :surname

  def initialize(student)
    @name = student[:name].capitalize
    @surname = student[:surname].capitalize
    @storage_homework = []
    @storage_notification_for_student = []
    @storage_notification_for_mentor = []
  end

  def add_homework_to_student_storage(homework)
    storage_homework << homework
  end

  def notifications
    print_notification_for_students_and_mentor(name, surname, storage_notification_for_student, 'student')
  end

  def mark_as_read!
    storage_notification_for_student.clear
  end

  def homeworks
    puts "Homework for student (#{name} #{surname})"
    storage_homework.each do |el|
      puts "Task: #{el.title}, discription: #{el.description}, \n\
Is homework in work: #{el.homework_in_work}; \n\
Is homework ready for check: #{el.homework_ready_for_check}, \n\
Is homework access by mentor: #{el.homework_accept_by_mentor} \n"
    end
    puts '-----------------------------'
  end

  def to_work!(homework)
    homework.homework_in_work = true
    storage_notification_for_mentor << Notification.new('To work!', homework.title)
  end

  def add_answer!(homework, answer)
    homework.storage_homework_answer << answer
    storage_notification_for_mentor << Notification.new('New answer!', homework.title)
  end

  def to_check!(homework)
    homework.homework_ready_for_check = true
    storage_notification_for_mentor << Notification.new('Ready to check!', homework.title)
  end
end
