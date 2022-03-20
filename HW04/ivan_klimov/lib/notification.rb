# frozen_string_literal: true

module Notification
  def add_hw(description)
    "#{description}\n"
  end

  def notification(text)
    "#{text}\n"
  end

  def hw_progress_nf(student, homework)
    "#{Time.new.strftime('%d-%m-%Y %H:%M:%S ')} #{student.name} #{student.surname} started #{homework.title}."
  end

  def read_all
    "#{Time.new.strftime('%H:%M:%S')} Read all notifications."
  end
end
