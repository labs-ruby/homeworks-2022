# frozen_string_literal: true

class Homework3
  def task1(log)
    log.split("\n").find { |x| x.downcase.include?('error') } || ''
  end
end
