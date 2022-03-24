# frozen_string_literal: true

require 'time'

class Notification
  atter_accessor :title, :description
  def initialize
    @title = title
    @description = description
  end

  def mark_as_read
    "Mark as read at #{Time.now}"
  end
end
