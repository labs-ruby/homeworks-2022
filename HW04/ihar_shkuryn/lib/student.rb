# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :notice, :homeworks_todo, :homeworks_in_progress

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @notice = Notification.new
    @homeworks_todo = []
    @homeworks_in_progress = []
  end

  def notifications
    # puts 'notice has been accepted by student!'
  end

end
