# frozen_string_literal: true

require 'time'

class Homework3
  def get_lines(log)
    log.split("\n").find_all { |line| line.include?('core') }
  end

  def calc_time(core_lines)
    core_lines.each_cons(2).map { |first, second| (second - first).to_s }
  end

  def task3(log)
    core_lines = get_lines(log)

    return '0' if core_lines.empty? || core_lines.length == 1

    core_lines.map! { |line| Time.parse(line) }

    res = calc_time(core_lines)

    return '0' if res.any? { |num| num.to_i.negative? }

    res.length == 1 ? res[0].to_s : res
  end
end
