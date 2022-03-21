# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :self
  attr_accessor :notice, :all_homeworks, :homeworks_for_check

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @subscriptions = []
    @notice = Notification.new
    @all_homeworks = []
    @homeworks_for_check = []
  end

  def add_homework(data)
    homework = Homework.new(data, self)
    all_homeworks.push(homework)
    data[:student].homeworks_todo.push(homework)
    homework
  end

  def subscribe_to!(student)
    debugger
    @subscriptions.push(student)
    student.notice.queue.push("Mentor #{@name} subscribed to #{student.name}")
  end
end
