# frozen_string_literal: true

require 'time'

class Notification
  attr_accessor :title, :description
  def initialize(title:, description:)
    @title = title
    @description = description
  end
end
