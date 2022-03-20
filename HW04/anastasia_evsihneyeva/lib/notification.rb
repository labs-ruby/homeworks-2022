# frozen_string_literal: true

class Notification
  attr_accessor :logs

  def initialize(text = nil)
    @logs =  []
    @logs << text if text
  end

  def mark_as_read!
    @logs.clear
  end
end
