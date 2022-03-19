class Mentor
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def add_homework(title, description, student)
    homework = Homework.new(title, description, student)
    student.add(homework)
  end

  def subscribe_to!(student)
    # mentor subscribe to student
    
  end

  def notifications
    # mentor see notification about homework to work
    
  end
  def mark_as_read!
    # mentor mark as read all notifications
  end

  def mentor_here
    p "I'm mentor and I am here!"
  end

  def reject_to_work!(homework)
    # mentor reject homework
  end

  def accept!(homework)
    # mentor accept homework
  end
end