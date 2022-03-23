# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def mark_as_read!
    notifications.clear
   end

  def to_work!(homework); end

  def add_answer!(homework, answer); end

  def to_check!(homework); end
end
