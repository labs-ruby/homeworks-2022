# frozen_string_literal: true

class Homework3
  def task1(log)
    return '' unless log.is_a?(String)

    log.split("\n").find { |string| string.include?('error') && right_format?(string) }.to_s
  end

  private

  def right_format?(string)
    string.match?(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}: \w+ \w+,/)
  end
end
