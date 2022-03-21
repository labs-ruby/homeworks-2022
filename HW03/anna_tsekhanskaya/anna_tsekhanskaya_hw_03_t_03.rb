# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_03.rb

require 'time'

class Homework3
  def task3(logs)
    return splited_transformed(logs)[0] if splited_transformed(logs.size == 1)
    return '0' if logs.map { |log| Time.parse(log) }.size <= 1
  end

  def splited_transformed(logs)
    logs.split("\n").select { |log| log.include?("Calling core with action:'") }
        .map { |log| Time.parse(log) }
        .each_cons(2).map! { |time1, time2| (time1 - time2).abs.to_s }
  end
end