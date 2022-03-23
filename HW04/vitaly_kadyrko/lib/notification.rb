# frozen_string_literal: true

class Notification
  attr_reader :homework, :text

  def initialize(homework:, text:)
    @homework = homework
    @text = text
  end

  def notification_messages
    { new_homework: new_homework_message, reject_work: reject_work_message, accept_work: accept_message,
      to_work: to_work_message, to_check: to_check_message }
  end

  def new_homework_message
    "New homework '#{homework.title}' was added"
  end

  def reject_work_message
    "Answers to homework '#{homework.title}' was rejected"
  end

  def accept_message
    "Homework '#{homework.title}' was accepted"
  end

  def to_work_message
    "Homework '#{homework.title}' was started"
  end

  def to_check_message
    "New answers to homework '#{homework.title}' was added"
  end
end
