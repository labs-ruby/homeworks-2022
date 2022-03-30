# frozen_string_literal: true

class Student
  include PrintNotify

  attr_accessor :homework, :all_notifications, :all_homeworks
  attr_reader :name, :surname

  def initialize(hash)
    @name = hash[:name]
    @surname = hash[:surname]
    @all_notifications = []
    @all_homeworks = []
  end

  def notifications
    all_notifications.each do |noti|
      next if noti.seen == true

      print_notify_for_student(noti)
    end
  end

  def mark_as_read!
    all_notifications.each { |n| n.seen = true }
  end

  def homeworks
    all_homeworks.each do |homew|
      case homew.accepted_by_mentor
      when false
        print_not_start(homew) if homew.started_execution == false
        print_start(homew) if homew.started_execution == true
      when true
        print_ready(homew)
      end
    end
  end

  def to_work!(homework)
    all_homeworks.each { |h| h.started_execution = true if homework == h }
    homework.notify_take_to_work
  end

  def add_answer!(homework, answer)
    homework.answer = answer
  end

  def to_check!(homework)
    homework.notify_to_check
  end
end
