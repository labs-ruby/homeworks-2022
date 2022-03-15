# frozen_string_literal: true

class Mentor
  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @students = []
  end

  def add_homework(data)
    Notification.new(log: "-New homework was added! Name #{data[:title]}")
    name = "#{@name} #{@surname}"
    Homework.new(data, name)
  end

  def subscribe_to!(student)
    Notification.new(log: "-Mentor #{@name} #{@surname} subscribed to #{student.name}")
    @students << student
  end

  def notifications
    Notification.new
  end

  def mark_as_read!
    Notification.new(log: '-Mark_as_read!')
  end

  def reject_to_work!(homework)
    Notification.new(log: "-Mentor #{@name} #{@surname} rejected homework #{homework.title}")
    homework.change_status('Rejected')
  end

  def accept!(homework)
    Notification.new(log: "-Mentor #{@name} #{@surname} accepted homework #{homework.title}")
    homework.change_status('Accepted')
  end
end
