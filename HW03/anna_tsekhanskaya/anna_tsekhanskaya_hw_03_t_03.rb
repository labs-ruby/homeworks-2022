# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_03.rb

require 'time'

class Homework3
  TIMESTAMP = /^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/
  def task3(logs)
    return '0' if events(logs).length < 2

    difference(events)
  end

  def events(logs)
    logs.split("\n").select { |line| line.include?('Calling core with action') }.map { |line| line =~ TIMESTAMP }
  end

  def difference(logs)
    diff = []
    diff << logs.each_cons(2).map! { |previos_event, next_event| (next_event - previos_event).to_s }
    diff.join(',')
  end
end
