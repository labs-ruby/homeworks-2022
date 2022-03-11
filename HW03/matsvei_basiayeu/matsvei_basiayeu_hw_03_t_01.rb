# frozen_string_literal: true

class Homework3
  def task1(log)
    log.split("\n").select { |message| message.include?('error') }.first.to_s
  end
end
