class Homework
  def initialize(title, description, student)
    @title = title
    @description = description
    @student = student
  end

  def read_hw 
    @student.student_here
  end
end