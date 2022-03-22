# frozen_string_literal: true

class Student
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  def notification; end

  def mark_as_read!; end

  def homeworks; end

  def to_work!(homework); end
end
