# frozen_string_literal: true

class Homework3
  def task1(log)
    rows = log.split("\n")
    rows.select { |str| str.include?('error') }[0].to_s
  end
end
