# frozen_string_literal: true

class Student
  attr_reader :name, :surname, :homeworks, :notifications

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @notifications = []
  end

  def mark_as_read!; end

  def to_works!(homework); end

  def add_answer!(homework); end

  def to_check!(homework); end
end
