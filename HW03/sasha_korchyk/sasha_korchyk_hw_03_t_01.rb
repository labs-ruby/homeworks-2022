# frozen_string_literal: true

class Homework3
  def task1(logs)
    return logs.split("\n").select { |i| i.include? 'error' }.first if logs.include? 'error'
    return '' unless logs.include? 'error'
  end
end
