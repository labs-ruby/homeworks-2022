# frozen_string_literal: true

CONVERT_DATE = %r{\d{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d{4}}
CONVERT_IP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
CONVERT_PATH = %r{/\w*/\d*/\w*}

class Homework3
  def task2(logs)
    return [] if logs.empty?

    lines = logs.split(/\n/)
    lines.each do |line|
      return [] unless right_format?(line)
    end
    format_lines(lines)
  end

  private

  def right_format?(string)
    string.match(/^\w/) ? true : false
  end

  def format_lines(strings)
    temp_array = []
    strings.each do |string|
      next if string.include?('error')

      temp_array << "DATE: #{convert_date(string)} FROM: #{convert_ip(string)} TO: #{convert_path(string)}"
    end
    temp_array
  end

  def convert_date(string)
    string.scan(CONVERT_DATE).join
  end

  def convert_ip(string)
    string.scan(CONVERT_IP).join
  end

  def convert_path(string)
    string.scan(CONVERT_PATH).join.upcase
  end
end
