# frozen_string_literal: true

class Homework3
  def task1(logs)
    return '' if logs.empty?

    lines = logs.split(/\n/)
    lines.find { |line| line.downcase.include?('error') } || ''
  end
end
