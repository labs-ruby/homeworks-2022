# frozen_string_literal: true

class Homework3
  def task1(log)
    arr = log.split("\n").map {|text| text.include?('error')}.to_s
    
  end
end
