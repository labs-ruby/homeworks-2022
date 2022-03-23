# frozen_string_literal: true

module HomeworkObservable
  def initialize
    @mentors = []
    @students = []
  end

  def add_mentor_observer(observer)
    @mentors << observer
  end

  def add_student_observer(observer)
    @students << observer
  end

  def delete_mentor(observer)
    @mentors.delete(observer)
  end

  def delete_student(observer)
    @students.delete(observer)
  end

  def notify_mentors
    @mentors.each do |observer|
      observer.update(self)
    end
  end

  def notify_students
    @students.each do |observer|
      observer.update(self)
    end
  end
end
