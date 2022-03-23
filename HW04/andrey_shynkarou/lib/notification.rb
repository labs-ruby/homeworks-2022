# frozen_string_literal: true

class Notification
  attr_reader :message

  def initialize(message)
    @message = message
  end
end
