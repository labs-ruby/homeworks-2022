# frozen_string_literal: true

class Homework3
  def task2(log)
    log.split("\n")
       .reduce([]) { |result, string| right_format?(string) ? result.push(output_string(string)) : result }
  end

  private

  def right_format?(string)
    string.scan(%r{\S+\s-\s-\s\D\d+/\w+/\S+\s\+\S+\s\S+\s\S+\s\w+/\d\.\d"\s\d+\s\S+\s\S+}).join == string
  end

  def output_string(string)
    "DATE: #{string.split(/[\[\]]/)[1]} FROM: #{string.split(' ')[0]} TO: #{string.split(' ')[6].upcase}"
  end
end
