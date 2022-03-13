# frozen_string_literal: true

require 'time'
class Homework3
  def task3(logs)
    array = time_parse(include_string(logs))
    if subtraction(array).length == 1
      subtraction(array)[0]
    else
      subtraction(array)
    end
  end

  def include_string(string)
    string.split("\n").find_all { |select_calling| select_calling.include?('Calling core with action:') }
  end

  def time_parse(array)
    array.map { |data_str| Time.parse(data_str) }
  end

  def subtraction(array)
    array.length <= 1 ? 0 : array.each_cons(2).map { |a, b| (b - a).to_s }
  end
end
h = Homework3.new
puts h.task3("
  2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event")
