# frozen_string_literal: true

# thi is class homework2
class Homework3
  SCAN_REGEX = %r{\d+\.\d\.\d+\.\d+\s-\s-\s\[\d+/\w+/\d+:\d+:\d+:\d+\s\+\d+\]\s"\w+\s/\S+\s\w+\S+\s\d+\s\S+\s\S+}
  REGEX_DATE = %r{\d+/\w+/\d+:\d+:\d+:\d+\s\+\d+}
  REGEX_IP = /\d+\.\d+\.\d+\.\d+/
  REGEX_TEXT = %r{/\w+/\d/\w+}
  def task2(log)
    return [] if log.instance_of?(NilClass)

    log.split("\n").delete_if { |string| valid_format?(string) != string }.map { |str| print_string(str) }
  end

  private

  def valid_format?(string)
    string.scan(SCAN_REGEX).join
  end

  def print_string(string)
    "DATE: #{string.match(REGEX_DATE)} FROM: #{string.match(REGEX_IP)} TO: #{string.match(REGEX_TEXT).to_s.upcase}"
  end
end
