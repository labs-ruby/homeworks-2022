# frozen_string_literal: true

class Homework3
  def task2(log)
    rows = log.split("\n")
    rows = rows.delete_if { |str| str.include?('ERROR') }
    rows.map do |ele|
      return [] unless ele.include?('[')

      "DATE: #{ele.split(/[\[\]]/)[1]} FROM: #{ele.split(' ')[0]} TO: #{ele.split(' ')[6].upcase}"
    end
  end
end
