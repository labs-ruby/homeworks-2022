# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname, :notifications, :subscriptions

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @subscriptions = []
    @notifications = []
  end

  def add_homework(title:, description:, student:); end

  def subscribe_to!(student); end

  def mark_as_read!; end

  def reject_to_work!(homework); end

  def accept!(homework); end
end
