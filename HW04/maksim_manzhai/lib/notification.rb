# frozen_string_literal: true

class Notification
  attr_accessor :readed

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)
    @readed = false
  end
end
