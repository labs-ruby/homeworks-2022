# frozen_string_literal: true

require 'singleton'

class Notification
  attr_reader :log

  def initialize(log = { log: nil })
    @log = log
    puts @log[:log]
  end
end
