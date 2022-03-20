# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :all_hw, :hw_in_progress, :notification

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @notification = Notification.new
    @all_hw = []
    @hw_in_progress = []
  end

  def notifications
    puts '*'
    puts notification.logs
  end

  def mark_as_read!
    notification.mark_as_read!
    puts 'Read!'
  end

  def homeworks
    hw_in_progress.each do |hw|
      puts "#{hw.title} - #{hw.description}"
    end
  end

  def to_work!(homework)
    hw_in_progress << homework
    homework.mentor.notification.logs << "Student #{name} work on #{homework.title}"
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    homework.mentor.hw_to_check << homework
    all_hw.delete(homework)
    homework.mentor.notification.logs << "Student #{name} added homework #{homework.title} to check"
  end
end
