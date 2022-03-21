# frozen_string_literal: true

class Student
  attr_reader :name, :surname
  attr_accessor :notice, :homeworks_todo, :homeworks_in_progress

  def initialize(data)
    @name = data[:name]
    @surname = data[:surname]
    @notice = Notification.new
    # @notice = []
    @homeworks_todo = []
    @homeworks_in_progress = []
  end

  def notifications
    # notice.push(Notification.new)
  end

  def mark_as_read!
    debugger
    notice.mark_as_read!
  end
end
