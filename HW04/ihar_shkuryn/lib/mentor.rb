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
    student = data[:student]
    homework = Homework.new(data, self)
    homework.message = "Student #{student.name} #{student.surname} got a new homework "\
    "from #{name} #{surname} title: #{@title}"
    all_homeworks.push(homework)
    student.homeworks_todo.push(homework)
    notice_handler(homework, student)
    homework
  end

  def notice_handler(homework, student)
    notice = Notification.new(homework.title)
    student.notices.push(notice)
  end

  def subscribe_to!(student)
    @subscriptions.push(student)
    student.notices.push("Mentor #{@name} subscribed to #{student.name}")
  end

  def notifications
    @notices.each do |notice|
      puts notice
    end
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
