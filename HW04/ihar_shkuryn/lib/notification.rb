# frozen_string_literal: true

class Notification
  attr_accessor :message

  def initialize(message)
    @message = message
  end
end
