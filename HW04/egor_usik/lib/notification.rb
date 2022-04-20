# frozen_string_literal: true

class Notification
  attr_reader :title, :description
  attr_accessor :read

  def initialize(title, description)
    @title = title
    @description = description

    @read = false
  end

  def unread?
    !@read
  end

  def mark_as_read
    @read = true
  end

  def mark_as_unread
    @read = false
  end
end
