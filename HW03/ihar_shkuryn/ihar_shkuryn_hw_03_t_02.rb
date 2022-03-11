# frozen_string_literal: true

class Homework3
  PATTERN = %r{(?:[0-9]{1,3}\.){3}[0-9]{1,3} - - \[\d{2}+/\w{3}/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}\]}
  def task2(log)
    arr_lines = find_lines_by_pattern log
    return [] unless arr_lines.size.positive?

    format_text arr_lines
  end

  def format_text(arr_lines)
    formatted_lines = []
    arr_lines.each do |line|
      words = line.split
      date_part = "DATE: #{words[3].delete('[')} #{words[4].delete(']')} "
      from_to_part = "FROM: #{words[0]} TO: #{words[6].upcase}"
      formatted_lines << date_part + from_to_part
    end
    formatted_lines
  end

  def find_lines_by_pattern(log)
    arr = []
    log.split("\n").each do |line|
      arr << line unless line.match(PATTERN).nil?
    end
    arr
  end
end
