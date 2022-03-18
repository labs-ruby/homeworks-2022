# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :self
  attr_accessor :notification_m, :all_hw, :hw_to_check
  
  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @subscriptions = []
    @notification_m = MentorNotification.new
    @all_hw = []
    @hw_to_check = []
  end

  def notifications
    puts '*'
    puts notification_m.logs
  end

  def mark_as_read!
    notification_m.mark_as_read!
    puts "Read!"
  end

  def add_homework(data)
    homework = Homework.new(data, self)
    all_hw << homework
    data[:student].all_hw << homework
    homework
  end

  def subscribe_to!(student)
    @subscriptions << student
    student.notification_s.logs << "Mentor #{@name} subscribe to #{student.name}"
  end

  def reject_to_work!(homework)
    homework.student.hw_in_progress << homework
    hw_to_check.delete(homework)
    homework.student.notification_s.logs << "Mentor #{name} rejected homework #{homework.title}"
  end

  def accept!(homework)
    hw_to_check.delete(homework)
    homework.student.hw_in_progress.delete(homework)
    homework.student.notification_s.logs << "Mentor #{name} accepted homework #{homework.title}"
  end 
end
