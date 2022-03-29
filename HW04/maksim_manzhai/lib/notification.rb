# frozen_string_literal: true

class Notification
  attr_accessor :readed

  def initialize(title:, description:)
    @title = title
    @description = description
    @readed = false
  end
end
