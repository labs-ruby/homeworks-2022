# frozen_string_literal: true

DATETIME = %r{\d{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d{4}}
IP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
ADDRESS = %r{/\w*/\d*/\w*}

class Homework3
  def task2(logs)
    return [] if logs.empty?

    lines = logs.split(/\n/)

    formated_lines = lines.find_all { |line| line.include?('POST') }
    formated_lines.each { |line| return [] if wrong_format?(line) }
    formated_lines.collect do |line|
      "DATE: #{line.scan(DATETIME).join} FROM: #{line.scan(IP).join} TO: #{line.scan(ADDRESS).join.upcase}"
    end
  end

  private

  def wrong_format?(string)
    string.match(/^\W/) ? true : false
  end
end
