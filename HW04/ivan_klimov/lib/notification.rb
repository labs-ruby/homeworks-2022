# frozen_string_literal: true

module Notification
  def nf_is_empty(person)
    person.notifications.include?("#{person.name}, you have read all notifications.")
  end

  def add_hw(title)
    " '#{Time.new.strftime('%d-%m-%Y %H:%M:%S')}' new homework : #{title}"
  end

  def read_all(person)
    "#{person.name}, you have read all notifications."
  end

  def subscribe_to(person)
    "'#{Time.new.strftime('%d-%m-%Y %H:%M:%S')}' #{person.name} #{person.surname} subscribed to you."
  end

  def to_work(student, homework)
    "'#{Time.new.strftime('%d-%m-%Y')}' #{student.name} #{student.surname} took to work #{homework.title}."
  end

  def to_check(student, homework)
    "'#{Time.new.strftime('%d-%m-%Y %H:%M:%S')}' #{student.name} #{student.surname} added answer for #{homework.title}."
  end

  def hw_reject(homework)
    "Answer for #{homework.title}, was rejected."
  end

  def hw_accept(homework)
    "Answer for #{homework.title}, was accepted."
  end
end
