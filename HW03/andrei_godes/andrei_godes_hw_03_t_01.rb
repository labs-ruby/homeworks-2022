# frozen_string_literal: true

class Homework3
  def task1(log)
    log.split("\n").find{ |text| text.include?('error') }.to_s
  end
end
