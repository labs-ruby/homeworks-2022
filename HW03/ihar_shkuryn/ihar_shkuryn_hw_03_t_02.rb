# frozen_string_literal: true

class Homework3
  PATTERN = %r{(?:[0-9]{1,3}\.){3}[0-9]{1,3} - - \[\d{2}+/\w{3}/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}\]}
  IP = /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/
  DATETIME = /.*?\[([^)]*)\].*/
  ADDRESS = /.*?POST ([^)]*)\ HTTP.*/

  def task2(log)
    arr_lines = find_lines_by_pattern(log)
    return [] unless arr_lines.size.positive?

    format_text arr_lines
  end

  def format_text(arr_lines)
    arr_lines.map do |line|
      datetime = line.scan(DATETIME).flatten.first.tr('[]', '')
      address = line.scan(ADDRESS).flatten.first.upcase.tr('[]', '')
      ip = line.scan(IP).flatten.first.tr('[]', '')
      "DATE: #{datetime} FROM: #{ip} TO: #{address}"
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
