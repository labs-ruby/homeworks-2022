# frozen_string_literal: true

class Homework3
  def task1(logs)
    variable = logs.to_s.split("\n")
    variable.each do |log|
      return log if log.include?('error')
    end
    ''
  end
end
