# frozen_string_literal: true

class Homework3
  def task1(log)
    return '' if log.instance_of?(NilClass)

    log.split("\n").find { |message| message.include?('error') }.to_s
  end
end
