# frozen_string_literal: true
require 'time'

class ClassName
  def get_lines(log, key_word)
    log.split("\n").select { |line| line != '' && line.include?(key_word) }
  end

  def task3(log)
    core_lines = get_lines(log, 'core')

    return '0' if core_lines.empty? || core_lines.length == 1

    core_lines.map! { |line| Time.parse(line) }

    i = 0
    res = []
    while i < core_lines.length - 1
      res << (core_lines[i + 1] - core_lines[i]).to_s
      i += 2
    end

    res
  end
end
