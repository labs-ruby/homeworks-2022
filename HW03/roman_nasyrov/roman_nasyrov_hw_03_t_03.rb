# frozen_string_literal: true

require 'time'
# declaring class
class Homework3
  def task3(log)
    result_array(log).size == 1 ? result_array(log)[0] : result_array(log)
  end

  private

  def result_array(log)
    logs = log.split("\n").select { |line| line.include?('Calling core with action:') }
    time = logs.map { |line| Time.parse(line[0..20]) }
    return '0' if time.size < 2

    time.each_cons(2).map { |a, b| [a, b].reduce(:-).abs.to_s }
  end
end
