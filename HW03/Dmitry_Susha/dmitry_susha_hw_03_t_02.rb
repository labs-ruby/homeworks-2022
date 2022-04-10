# frozen_string_literal: true

class Homework3
  FORMAT_STRING = %r{^(?:[0-9]{1,3}\.){3}[0-9]{1,3} - - \[\d*/\w*/\d*:\d*:\d*:\d* \+\d*\] "\w* /\w*/\d/\w*}
  def task2(logs)
    return [] unless logs.is_a?(String)

    lines = logs.split("\n")
    lines.select { |string| check_format?(string) }.map { |string| make_output(string) }
  end

  private

  def check_format?(string)
    string.match?(FORMAT_STRING)
  end

  def make_output(string)
    string = string.split
    "DATE: #{string[3][1..]} #{string[4][0..-2]} FROM: #{string[0]} TO: #{string[6].upcase}"
  end
end
