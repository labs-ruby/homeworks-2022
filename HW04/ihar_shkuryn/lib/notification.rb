# frozen_string_literal: true

class Notification
  attr_accessor :queue

  def initialize(message = nil)
    debugger
    @queue = []
    @queue.push(message) if message
  end

  def mark_as_read!
    @queue.clear
  end
end
