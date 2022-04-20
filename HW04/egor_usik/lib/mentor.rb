# frozen_string_literal: true

require_relative 'person'

class Mentor < Person
  attr_accessor :name, :surname

  def initialize(name:, surname:)
    super

    @subscribtions = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description)
    homework.creator = self
    student.add_notification(Notification.new('Homework was added.',
                                              "The homework #{homework.title} was added for '#{student.fullname}'."))
    student.add_homework(homework)
    homework
  end

  def reject_to_work!(homework)
    @subscribtions.each do |student|
      student.add_notification(Notification.new('Homework was rejected.',
                                                "The homework #{homework.title} was rejected."))
    end
    homework.mark_as_rejected!
  end

  def accept!(homework)
    @subscribtions.each do |student|
      student.add_notification(Notification.new('Homework was accepted.',
                                                "The homework #{homework.title} was accepted."))
    end
    homework.mark_as_accepted!
  end

  def subscribe_to!(student)
    @subscribtions << student
  end
end
