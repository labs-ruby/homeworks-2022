require_relative 'homework_observable'
require_relative 'notification'
class Homework
  include HomeworkObservable
  include Notification
  attr_reader :title, :description, :student
  attr_accessor :state

  def initialize(title:, description:, student:, state: 'Created')
    super()
    @title = title
    @description = description
    @student = student
    @state = state
    add_notification(student, "You have new homework: #{title}")
    add_homework(student)
  end

  def to_work!
    self.state = 'In work'
    update_state_in_file(student)
    notify_mentors
  end

  def add_answer!(answer)
    add_data(folder(student), homework_file, "Answer: #{answer}")
  end

  def to_check!
    self.state = 'Pending rewiev'
    update_state_in_file(student)
    notify_mentors
  end

  def reject!(mentor, remarks)
    self.state = 'Rejected'
    update_state_in_file(student)
    add_remarks(mentor, remarks)
    notify_students
  end

  def accept!(grade)
    self.state = 'Passed'
    update_state_in_file(student)
    add_grade(grade)
    notify_students
  end

  private

  def update_state_in_file(user)
    file = File.read("#{folder(user)}/#{homework_file}")
    new_content = file.split("\n")
    new_content = new_content.map { |line| line.include?('State:') ? "State: #{state}" : line }.join("\n")
    File.open("#{folder(user)}/#{homework_file}", 'w') { |line| line.puts new_content }
  end

  def add_remarks(mentor, remarks)
    mentor_remarks = "#{mentor.name} #{mentor.surname} : #{remarks}"
    add_data(folder(student), homework_file, mentor_remarks)
  end

  def add_grade(grade)
    star = "\u{1F31F}"
    stars_grade = "Grade: #{star * grade}"
    add_data(folder(student), homework_file, stars_grade)
  end

  def add_homework(student)
    homework_data = "State: #{state}\nTitle: #{title}\nDescription: #{description}"
    add_data(folder(student), homework_file, homework_data)
  end

  def homework_file
    "#{title}.txt"
  end
end
