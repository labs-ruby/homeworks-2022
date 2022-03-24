# frozen_string_literal: true

require 'time'

class Notification
  atter_accessor :title, :description
  def initialize
    @title = title
    @description = description
    @mark_as_read = false
  end
end
