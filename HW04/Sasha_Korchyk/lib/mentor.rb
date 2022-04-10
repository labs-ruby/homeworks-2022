# frozen_string_literal: true

class Mentor
  include PrintNotify

  attr_reader :name, :surname, :subscribe, :all_notifications

  def initialize(hash)
    @name = hash[:name]
    @surname = hash[:surname]
    @subscribe = []
    @all_notifications = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description, student, self)
    homework.notify_add_homework
    homework
  end

  def subscribe_to!(student)
    subscribe << student
  end

  def notifications
    all_notifications.each do |noti|
      next if noti.seen == true

      print_notify_for_mentor(noti)
    end
  end

  def mark_as_read!
    all_notifications.each { |n| n.seen = true }
  end

  def reject_to_work!(homework)
    homework.notify_reject_to_work
  end

  def accept!(homework)
    homework.student.all_homeworks.each { |h| h.accepted_by_mentor = true if homework == h }
    homework.notify_accept
  end
end
