# frozen_string_literal: true

# get log as a string and return line including keyword 'error'
class Homework3
  def task1(log)
    return '' unless log.respond_to? :split

    log.split("\n").find { |line| line.include?('error') }.to_s
  end
end
