# frozen_string_literal: true

class Mentor
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  def add_new_homework(title:, description:, student:)
    Homework.new(title: title, description: description, student: student)
  end

  def subscribed_to!(student); end

  def notification; end

  def mark_as_read!; end

  def reject_to_work!(homework); end

  def accept!(homework); end
end
