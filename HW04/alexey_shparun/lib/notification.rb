# frozen_string_literal: true

class Notification
  attr_reader :notify

  def initialize(notify)
    @notify = notify
  end

  def display
    puts notify
  end
end
