class Student
  attr_accessor :storage_homework, :storage_notification, :storage_notification_for_mentor
  attr_reader :name, :surname
  
  def initialize (student)
    @name = student[:name]
    @surname = student[:surname]
    @storage_homework = []
    @storage_notification = []
    @storage_notification_for_mentor = []
  end

  def add_homework_to_student_storage(hw)
    @storage_homework << hw
  end

  # def add_notification_to_student_storage(notification)
  #   @storage_notification << notification
  # end

  def notifications
    #student see notification about new homework
    # student see notification about homework was reject
    # student see notification about homework was accept
    puts "Notification:"
    @storage_notification.each{|el| puts "Title: #{el.title}, discription: #{el.description}"}
    puts '//-----------------------------//'
  end

  def mark_as_read!
    @storage_notification.clear
  end

  def homeworks
    # student can see homeworks
    puts "Name: #{@name} Surname: #{@surname}"
    @storage_homework.each{|el| puts "Task: #{el.title}, discription: #{el.description}, \
to_work: #{el.to_work} answer #{el.storage_answer.each{|el| el}}, access by mentor: #{el.accept_by_mentor}"}
  end

  def to_work!(homework)
    homework.to_work = true
    @storage_notification_for_mentor << Notification.new('To work!', homework.title)
  end

  def add_answer!(homework, answer)
    homework.storage_answer << answer
    @storage_notification_for_mentor << Notification.new('New answer!', homework.title)
  end

  def to_check!(homework)
    # student sent to check homework
    homework.ready_for_check = true
    @storage_notification_for_mentor << Notification.new('Ready to check!', homework.title)
  end

end