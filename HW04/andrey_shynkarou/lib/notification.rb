# frozen_string_literal: true

class Notification
  def initialize(sender:, message:)
    @sender = sender
    @message = message
  end
end
