# frozen_string_literal: true

class Homework3
  def task1(logs)
    logs.split("\n").find { |current_string| current_string.include? 'error' }.to_s
  end
end
