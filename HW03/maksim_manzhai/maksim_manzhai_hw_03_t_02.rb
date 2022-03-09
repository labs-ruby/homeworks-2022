# frozen_string_literal: true

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
    string.scan(%r{\d{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d{4}}).join
  end

  def convert_ip(string)
    string.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/).join
  end

  def convert_path(string)
    string.scan(%r{/\w*/\d*/\w*}).join.upcase
  end
end
