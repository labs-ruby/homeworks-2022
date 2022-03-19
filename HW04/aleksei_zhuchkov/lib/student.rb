class Student
  attr_accessor :storage
  attr_reader :name, :surname
  
  def initialize (name, surname)
    @name = name
    @surname = surname
    @storage = []
  end

  def student_here
    p "I'm student #{@name} #{@surname} and I am here!"
  end
  def add(hw)
    @storage << hw
    puts @storage
  end
  def say
    @storage.each{|el| puts el.title}
  end

  def notifications
    #student see notification about new homework
    # student see notification about homework was reject
    # student see notification about homework was accept
    
  end

  def mark_as_read!
    #student mark as read all notifications

  end

  def homeworks
    # student can see homeworks
    
  end

  def to_work!(homework)
    # student take to work homework
    
  end

  def add_answer!(homework, answer)
    # student add answer to homework
  end

  def to_check!(homework)
    # student sent to check homework
  end

end