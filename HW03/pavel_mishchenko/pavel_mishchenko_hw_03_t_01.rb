# frozen_string_literal: true

class Homework3
  def lines(logs)
    logs.lines(chomp: true)
  end

  def task1(logs)
    result = lines(logs).select { |line| line.downcase.include?('error') }.first
    result.nil? ? '' : result
  end
end
