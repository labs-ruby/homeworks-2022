# frozen_string_literal: true

class Homework3
  IP = /\b(?:\d{1,3}\.){3}\d{1,3}\b/
  DATETIME = /\[([^)]+)\]/
  ADDRESS = /".*?"/

  def get_lines(log)
    log.split("\n").find_all { |line| line.include?('POST') }
  end

  def task2(log)
    err_log = get_lines(log)

    err_log.map do |line|
      "DATE: #{line.scan(DATETIME)[0][0]} "\
      "FROM: #{line[IP]} "\
      "TO: #{line[ADDRESS].split[1].upcase}"
    end
  rescue StandardError
    []
  end
end
