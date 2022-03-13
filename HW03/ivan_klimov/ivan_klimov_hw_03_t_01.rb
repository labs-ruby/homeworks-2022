# frozen_string_literal: true

class Homework3
  def task1(logs)
    logs.split("\n").select { |log| log.downcase.include?('error') }.first.to_s
  end
end
