# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_03.rb

require 'time'

class Homework3
  def task3(logs)
    return '0' unless calling_core_with_action(logs).size < 2

    splited_transformed(logs).size == 1 ? splited_transformed(logs)[0] : splited_transformed(logs)
  end

  def calling_core_with_action(logs)
    logs.split("\n").select { |log| log.include?('Calling core with action:') }
  end

  def splited_transformed(logs)
    logs.split("\n").map { |elem| Time.parse(elem) }
        .each_cons(2).map { |time1, time2| (time2 - time1).abs.to_s }
  end
end
