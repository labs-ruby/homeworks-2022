# frozen_string_literal: true

class Homework3
  PATTERN = %r{(?:[0-9]{1,3}\.){3}[0-9]{1,3} - - \[\d{2}+/\w{3}/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}\]}
  REG_IP = /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/
  REG_DATETIME = %r{(\[\d+/\w+/\d+:\d+:\d+:\d+ \+\d{4}\])}
  REG_TEXT = /(".+")/

  def task2(log)
    arr_lines = find_lines_by_pattern(log)
    return [] unless arr_lines.size.positive?

    format_text arr_lines
  end

  def format_text(arr_lines)
    arr_lines.map do |line|
      "DATE: #{line.match(REG_DATETIME).to_s.delete('[]')} \FROM: #{line.match(REG_IP)} \TO: #{line.match(REG_TEXT)
        .to_s.split.slice(1).upcase}"
    end
  end

  def find_lines_by_pattern(log)
    arr_lines = []
    log.split("\n").each do |line|
      arr_lines << line unless line.match(PATTERN).nil?
    end
    arr_lines
  end
end
