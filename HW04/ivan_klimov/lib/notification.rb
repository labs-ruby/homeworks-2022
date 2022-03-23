# frozen_string_literal: true

module Notification
  def check_for_active_notifications(person)
    person.notifications.include?("#{person.name}, you have read all notifications.")
  end

  def push_homework(title)
    " '#{Time.new.strftime('%d-%m-%Y %H:%M:%S')}' new homework : #{title}"
  end

  def read_all_notifications(person)
    "#{person.name}, you have read all notifications."
  end

  def subscribe_to(person)
    "'#{Time.new.strftime('%d-%m-%Y %H:%M:%S')}' #{person.name} #{person.surname} subscribed to you."
  end

  def status_to_work(student, homework)
    "'#{Time.new.strftime('%d-%m-%Y')}' #{student.name} #{student.surname} took to work #{homework.title}."
  end

  def status_to_check(student, homework)
    "'#{Time.new.strftime('%d-%m-%Y %H:%M:%S')}' #{student.name} #{student.surname} added answer for #{homework.title}."
  end

  def homework_reject(homework)
    "Answer for #{homework.title}, was rejected."
  end

  def homework_accept(homework)
    "Answer for #{homework.title}, was accepted."
  end
end
