# frozen_string_literal: true

class Homework3
  def task1(logs)
    logs.split("\n").each do |log|
      return log if log.include?('error')
    end
    ''
  end
end
