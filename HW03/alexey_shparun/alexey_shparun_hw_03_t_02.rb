# frozen_string_literal: true

class Homework3
  SCAN_STRING = %r{\d+\.\d+\.\d+\.\d+\s\S\s\S\s\[\d+/\w+/\d+:\d+:\d+:\d+\s\+\d+\]\s\S\w+\s/\S+\s\w+\S+\s\d+\s\S+\s\S+}
  IP = /\d+\.\d+\.\d+\.\d+/
  DATE = %r{\d+/\w+/\d+:\d+:\d+:\d+\s\S\d+}
  PATH = %r{/\w+/\d+/\w+}
  def task2(logs)
    logs.split("\n").find_all { |string| string.match?(SCAN_STRING) }.map { |str| result(str) }
  end

  def result(str)
    "DATE: #{str.match(DATE)} FROM: #{str.match(IP)} TO: #{str.match(PATH).to_s.upcase}"
  end
end
