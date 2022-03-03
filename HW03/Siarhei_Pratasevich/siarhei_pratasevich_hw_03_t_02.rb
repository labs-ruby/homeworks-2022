# frozen_string_literal: true

class Homework3
  def task2(log, result = [])
    log.split("\n").each do |string|
      next unless string.scan(%r{\S+\s-\s-\s\D\d+/\w+/\S+\s\+\S+\s\S+\s\S+\s\w+/\d\.\d"\s\d+\s\S+\s\S+}).join == string

      result
        .push("DATE: #{string.split(/[\[\]]/)[1]} FROM: #{string.split(' ')[0]} TO: #{string.split(' ')[6].upcase}")
    end
    result
  end
end
