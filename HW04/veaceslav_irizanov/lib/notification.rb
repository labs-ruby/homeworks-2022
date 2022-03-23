# frozen_string_literal: true

class Notification
  attr_reader :text

  def initialize(text)
    @text = text
  end
end
