# frozen_string_literal: true

class Homework3
  def task1(log)
    return '' if log.nil?

    log.split("\n").find { |message| message.include?('error') }.to_s
  end
end
