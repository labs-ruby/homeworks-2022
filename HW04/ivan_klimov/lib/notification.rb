# frozen_string_literal: true

module Notification
  def current_time
    Time.new.strftime('%d-%m-%Y %H:%M:%S')
  end

  def active_notifications_present?(person)
    person.notifications.include?("#{person.name}, you have read all notifications.")
  end

  def new_homework(title)
    "'#{current_time}' new homework: #{title}"
  end

  def read_all_notifications(person)
    "#{person.name}, you have read all notifications."
  end

  def subscribe_to(person)
    "'#{current_time}' #{person.name} #{person.surname} subscribed to you."
  end

  def status_to_work(student, homework)
    "'#{current_time}' #{student.name} #{student.surname} took to work #{homework.title}."
  end

  def status_to_check(student, homework)
    "'#{current_time}' #{student.name} #{student.surname} added answer for #{homework.title}."
  end

  def homework_reject(homework)
    "Answer for #{homework.title}, was rejected."
  end

  def homework_accept(homework)
    "Answer for #{homework.title}, was accepted."
  end
end
