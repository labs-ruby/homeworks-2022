# frozen_string_literal: true

require_relative 'person'

class Mentor < Person
  attr_accessor :name, :surname
  attr_reader :homeworks, :subscriptions

  def initialize(name:, surname:)
    super

    @homeworks = []
    @subscriptions = []
  end

  def add_homework(title:, description:, student:)
    homework = Homework.new(title, description)
    homework.creator = self
    @homeworks << homework

    student.add_notification(Notification.new('Homework was added.',
                                              "The homework #{homework.title} was added for '#{student.fullname}'."))
    student.add_homework(homework)
    homework
  end

  def reject_to_work!(homework)
    return if homework.nil?

    @subscriptions.each do |student|
      student.add_notification(Notification.new('Homework was rejected.',
                                                "The homework #{homework.title} was rejected."))
    end
    homework.mark_as!(HomeworkStatuses::REJECTED)
  end

  def accept!(homework)
    @subscriptions.each do |student|
      student.add_notification(Notification.new('Homework was accepted.',
                                                "The homework #{homework.title} was accepted."))
    end
    homework.mark_as!(HomeworkStatuses::ACCEPTED)
  end

  def subscribe_to!(student)
    return if student.nil?

    @subscriptions << student
  end
end
