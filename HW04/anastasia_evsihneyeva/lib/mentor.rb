# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :homework, :self
  attr_accessor :notification_list, :all_hw

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @all_hw = []
    @notification_list = []
  end

  def notifications
    notification_list.each(&:output)
  end

  def notify(notification, student)
    student.notification_list << notification
  end

  def mark_as_read!
    notification_list.clear
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description, student, self)
    notify(Notification.new("Homework #{title} was added to #{student.name} by mentor #{name}"), homework.student)
    all_hw << homework
    homework
  end

  def subscribe_to!(student)
    @subscriptions << student
    notify(Notification.new("Mentor #{@name} subscribe to #{student.name}"), student)
  end

  def reject_to_work!(homework)
    homework.status = 'Rejected'
    notify(Notification.new("Mentor #{name} rejected homework #{homework.title}"), homework.student)
  end

  def accept!(homework)
    homework.status = 'Finished'
    notify(Notification.new("Mentor #{name} accepted homework #{homework.title}"), homework.student)
  end
end
