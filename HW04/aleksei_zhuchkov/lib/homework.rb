class Homework
  attr_accessor :title, :description, :student, :to_work, :storage_answer, :ready_for_check, :accept_by_mentor

  def initialize(title, description, student)
    @title = title
    @description = description
    @student = student
    @storage_answer = []
    @to_work = false
    @ready_for_check = false
    @accept_by_mentor = false
  end

end