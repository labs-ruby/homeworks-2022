# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :all_hw, :hw_in_progress, :notification_s

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @notification_s = StudentNotification.new
    @all_hw = []
    @hw_in_progress = []
  end

  def notifications
    puts '*'
    puts notification_s.logs
  end

  def mark_as_read!
    notification_s.mark_as_read!
    puts 'Read!'
  end

  def homeworks
    hw_in_progress.each do |hw|
      puts "#{hw.title} - #{hw.description}"
    end
  end

  def to_work!(homework)
    hw_in_progress << homework
    homework.mentor.notification_m.logs << "Student #{name} work on #{homework.title}"
  end

  def add_answer!(homework, answer)
    homework.answers << answer
  end

  def to_check!(homework)
    homework.mentor.hw_to_check << homework
    all_hw.delete(homework)
    homework.mentor.notification_m.logs << "Student #{name} added homework #{homework.title} to check"
  end
end
