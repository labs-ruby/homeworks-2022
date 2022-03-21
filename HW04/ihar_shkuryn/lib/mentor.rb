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
    @subscriptions.push(student)
    student.notice.queue.push("Mentor #{@name} subscribed to #{student.name}")
  end

  def notifications
    # any logic here'
  end

  def mark_as_read!
    notice.mark_as_read!
  end

  def reject_to_work!(homework)
    homework.student.homeworks_todo.push(homework)
    homeworks_for_check.delete(homework)
    homework.student.notice.queue.push("Mentor #{name} rejected homework #{homework.title}")
  end

  def accept!(homework)
    debugger
    homeworks_for_check.delete(homework)
    homework.student.homeworks_in_progress.delete(homework)
    homework.student.notice.queue.push("Mentor #{name} accepted homework #{homework.title}")
  end

end
