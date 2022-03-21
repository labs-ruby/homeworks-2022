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

  def notifications
    # puts 'notice to mentor'
  end

  def add_homework(data)
    homework = Homework.new(data, self)
    all_homeworks.push(homework)
    data[:student].homeworks_todo.push(homework)
    homework
  end

  def mark_as_read!
    notice.mark_as_read!
    # puts 'notice has been read by mentor'
  end

  def accept!(homework)
    homeworks_for_check.delete(homework)
    homework.student.homeworks_todo.delete(homework)
    homework.student.notice.queue.push("Mentor #{name} accepted homework #{homework.title}")
  end

  def reject_to_work!(homework)
    homework.student.homeworks_todo.push(homework)
    homeworks_for_check.delete(homework)
    homework.student.notice.queue.push("Mentor #{name} rejected homework #{homework.title}")
  end

  def subscribe_to!(student)
    @subscriptions.push(student)
    student.notice.queue.push("Mentor #{@name} subscribed to #{student.name}")
  end
end
