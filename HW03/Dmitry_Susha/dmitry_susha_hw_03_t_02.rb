# frozen_string_literal: true

class Homework3
  def task2(logs)
    result = []
    logs.split("\n").each do |string|
      result << make_output(string) if check_format?(string)
    end
    result
  end

  private

  def check_format?(string)
    string.match?(%r{^(?:[0-9]{1,3}\.){3}[0-9]{1,3} - - \[\d*/\w*/\d*:\d*:\d*:\d* \+\d*\] "\w* /\w*/\d/\w*})
  end

  def make_output(string)
    string = string.split
    "DATE: #{string[3][1..]} #{string[4][0..-2]} FROM: #{string[0]} TO: #{string[6].upcase}"
  end
end
