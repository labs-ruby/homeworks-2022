# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :self
  attr_accessor :notification, :all_hw, :hw_to_check

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @subscriptions = []
    @notification = Notification.new
    @all_hw = []
    @hw_to_check = []
  end

  def notifications
    puts '*'
    puts notification.logs
  end

  def mark_as_read!
    notification.mark_as_read!
    puts 'Read!'
  end

  def add_homework(data)
    homework = Homework.new(data, self)
    data[:student].notification.logs << "Homework #{data[:title]} was added to #{data[:student].name} by mentor #{name}"
    all_hw << homework
    data[:student].all_hw << homework
    homework
  end

  def subscribe_to!(student)
    @subscriptions << student
    student.notification.logs << "Mentor #{@name} subscribe to #{student.name}"
  end

  def reject_to_work!(homework)
    homework.student.hw_in_progress << homework
    hw_to_check.delete(homework)
    homework.student.notification.logs << "Mentor #{name} rejected homework #{homework.title}"
  end

  def accept!(homework)
    hw_to_check.delete(homework)
    homework.student.hw_in_progress.delete(homework)
    homework.student.notification.logs << "Mentor #{name} accepted homework #{homework.title}"
  end
end
