# frozen_string_literal: true

class Notification
  attr_accessor :logs

  def initialize(logs)
    @logs = logs
  end

  def output
    puts logs
  end
end
