# frozen_string_literal: true

class Homework3
  def get_lines(log)
    log.split("\n").find_all { |line| line.include?('error') }
  end

  def task1(log)
    err_log = get_lines(log)
    err_log.empty? ? '' : err_log[0].to_s.strip
  end
end
