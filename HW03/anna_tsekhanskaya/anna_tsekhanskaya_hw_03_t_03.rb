# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_03.rb

require 'time'

class Homework3
  TIMESTAMP = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/
  def task3(logs)
    return '0' if events(logs).size <= 1

    difference(events)
  end

  def events(logs)
    logs.split("\n").select { |line| line.include?('Calling core with action') }.map { |line| line[TIMESTAMP] }
  end

  def difference(logs)
    diff = []
    logs.each_cons(2) do |previos_event, next_event|
      diff << Time.parse(next_event) - Time.parse(previos_event)
    end
    diff.join(',')
  end
end
