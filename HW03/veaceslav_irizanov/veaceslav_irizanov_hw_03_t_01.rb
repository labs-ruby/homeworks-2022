# frozen_string_literal: true

class Homework3
  CONDITION = 'error'
  def task1(log)
    rows = log.split("\n").find { |str| str.include?(CONDITION) }
    rows.nil? ? '' : rows
  end
end
