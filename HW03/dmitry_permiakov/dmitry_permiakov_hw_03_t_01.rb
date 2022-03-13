# frozen_string_literal: true

class Homework3
  def task1(logs)
    logs.split("\n").select { |v| v.include? 'error' }[0].to_s
  end
end
