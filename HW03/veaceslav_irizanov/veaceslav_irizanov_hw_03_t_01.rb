# frozen_string_literal: true

class Homework3
  def task1(log)
    rows = log.split("\n").find { |str| str.include?('error') }
    rows.nil? ? '' : rows
  end
end
