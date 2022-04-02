# frozen_string_literal: true

class Homework3
  def task1(logs)
    raise ArgumentError unless logs.is_a?(String)

    result = lines(logs).select { |line| line.downcase.include?('error') }.first
    result.nil? ? '' : result
  end

  private

  def lines(logs)
    logs.lines(chomp: true)
  end
end
