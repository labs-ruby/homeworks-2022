# frozen_string_literal: true

class Homework3
  def task1(logs)
    return '' if logs.empty?

    logs.split(/\n/).find { |line| line.downcase.include?('error') } || ''
  end
end
