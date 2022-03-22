# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :self
  attr_accessor :notices, :all_homeworks, :homeworks_for_check

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @subscriptions = []
    @notices = []
    @all_homeworks = []
    @homeworks_for_check = []
  end

  def add_homework(data)
    homework = Homework.new(data, self)
    all_homeworks.push(homework)
    data[:student].homeworks_todo.push(homework)
    notice = Notification.new(homework.title)
    data[:student].notices.push(notice)
    homework
  end

  def subscribe_to!(student)
    @subscriptions.push(student)
    student.notices.push("Mentor #{@name} subscribed to #{student.name}")
  end

  def notifications
    # any logic here'
  end

  def mark_as_read!
    notices.clear
  end

  def reject_to_work!(homework)
    homework.student.homeworks_todo.push(homework)
    homeworks_for_check.delete(homework)
    homework.student.notices.push("Mentor #{name} rejected homework #{homework.title}")
  end

  def accept!(homework)
    homeworks_for_check.delete(homework)
    homework.student.homeworks_in_progress.delete(homework)
    homework.student.notices.push("Mentor #{name} accepted homework #{homework.title}")
  end
end
