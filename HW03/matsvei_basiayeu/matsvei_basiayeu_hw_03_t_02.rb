# frozen_string_literal: true

# thi is class homework2
class Homework3
  SCAN_REGEX = %r{\d+\.\d\.\d+\.\d+\s-\s-\s\[\d+/\w+/\d+:\d+:\d+:\d+\s\+\d+\]\s"\w+\s/\S+\s\w+\S+\s\d+\s\S+\s\S+}
  SPLIT_REGEX = /[\[(.*)\]]/

  def task2(log)
    res = []
    log.split("\n").each do |i|
      good_format?(i) == i ? res << (print_string(i)) : res
    end
    res
  end

  private

  def good_format?(string)
    string.scan(SCAN_REGEX).join
  end

  def print_string(string)
    "DATE: #{string.split(SPLIT_REGEX)[4]} FROM: #{string.split(' ')[0]} TO: #{string.split(' ')[6].upcase}"
  end
end
