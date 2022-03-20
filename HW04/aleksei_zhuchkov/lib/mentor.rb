class Mentor
  attr_accessor :name, :surname, :storage_students #:storage_notification

  def initialize(mentor)
    @name = mentor[:name]
    @surname = mentor[:surname]
    @storage_students = []
    # @storage_notification = []
  end

  def add_homework(title, description, student)
    homework = Homework.new(title, description, student)
    student.add_homework_to_student_storage(homework)
    student.storage_notification << Notification.new("Add homework", homework.title)
    homework
  end

  def subscribe_to!(student)
   @storage_students << student
  #  @storage_students.each{|el| puts el.storage_homework.each{|el| puts el.title}}
    
  end

  def notifications
    # mentor see notification about homework to work
    return "None notification" if @storage_students.empty?
    @storage_students.each do |student|
      puts "Students: #{student.name} #{student.surname}"
      student.storage_notification_for_mentor.each{|el| puts "Title: #{el.title}, discription: #{el.description}"}
    end
  end
  def mark_as_read!
    # mentor mark as read all notifications
    @storage_answer.each{|student| student.storage_notification_for_mentor.clear}
  end

  def reject_to_work!(homework)
    # mentor reject homework
    homework.ready_for_check = false
    homework.student.storage_notification << Notification.new("Reject homework", homework.title)
  end

  def accept!(homework)
    # mentor accept homework
    homework.accept_by_mentor = true
    homework.student.storage_notification << Notification.new("Accept", homework.title)
  end
end