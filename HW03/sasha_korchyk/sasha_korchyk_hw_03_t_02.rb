# frozen_string_literal: true

reg = '\d{2}.\d.\d{3}.\d{3}\s-\s-\s\[\d{1,2}/\w{3,4}/\d{4}:\d{1,2}:\d{1,2}:\d{1,2}' \
'\s\+\d{4}\]\s"\w{3,6}\s/\w+/\d+/\w+\s\w{4,5}/\d{1,2}.\d{1,2}"\s\d{3}\s.{1,2}\s\d+.\d{4}'
REG = Regexp.new(reg)
DATE = %r{\d{1,2}/\w{3,4}/\d{4}:\d{1,2}:\d{1,2}:\d{1,2}\s\+\d{4}}
FROM = /\d{2}.\d.\d{3}.\d{3}/
TO = %r{/\w+/\d+/\w+}

class Homework3
  def task2(logs)
    return [] if logs.empty?

    arr = []
    res = []
    logs.split("\n").map { |i| i.match(REG) }.each { |i| arr << i.to_s unless i.nil? }
    arr.each do |i|
      res << "DATE: #{i.match(DATE)} FROM: #{i.match(FROM)} TO: #{i.match(TO).to_s.upcase}"
    end
    res
  end
end
