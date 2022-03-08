# frozen_string_literal: true

class Homework3
  def task1(logs)
    if logs.empty?
      ''
    else
      lines = logs.split(/\n/)
      lines.each do |line|
        return line if line.include?('error')
      end
    end
    ''
  end
end
