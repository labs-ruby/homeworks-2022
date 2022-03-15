# frozen_string_literal: true

class Student
  attr_accessor :notification

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @homeworks = []
  end

  def name
    "#{@name} #{@surmane}"
  end

  def notifications
    Notification.new
  end

  def mark_as_read!
    Notification.new(log: '-Mark_as_read!')
  end

  def homeworks
    @homeworks.each { |hw| puts hw.title }
  end

  def to_work!(homework)
    Notification.new(log: "-Student #{@name} #{@surname} working on #{homework.title}")
    @homeworks << homework
  end

  def add_answer!(homework, answer)
    text = "#{@name} #{@surname}: #{answer}"
    homework.add_answer!(text)
  end

  def to_check!(homework)
    Notification.new(log: "-Student #{@name} #{@surname} add to check #{homework.title}")
    homework.to_check!(@name, @surname)
  end
end
