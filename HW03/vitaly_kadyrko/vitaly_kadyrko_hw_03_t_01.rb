# frozen_string_literal: true

class Homework3
  def task1(log)
    array_with_lines = log.split("\n")
    array_with_error_lines = array_with_lines.select { |x| x.downcase.include?('error') }
    if array_with_error_lines == []
      ''
    else
      array_with_error_lines[0].to_s
    end
  end
end
