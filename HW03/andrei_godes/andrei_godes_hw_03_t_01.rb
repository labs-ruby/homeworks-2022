# frozen_string_literal: true

class Homework3
  def task1(log)
    arr = log.split("\n").map do |text|
      if text.include?('error') then text
      else
        ' '
      end
    end
    arr.each { |element| puts element }
  end
end
