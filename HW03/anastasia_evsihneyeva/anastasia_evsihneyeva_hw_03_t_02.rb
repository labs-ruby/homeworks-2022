# frozen_string_literal: true

class Homework3
  DATE = /\[(.*)\]/
  FROM = /(.*)(?=\ - -)/
  TO = %r{/te(.*)(?=\ H)}
  def task2(logs)
    return [] if logs.nil?

    variable = logs.to_s.split("\n")
    info = []
    variable.each do |log|
      next unless log.include?('POST') && log =~ /(.*) - - \[(.*)\] "(.*)" (.*)/

      str = "DATE: #{DATE.match(log)[1]} FROM: #{FROM.match(log)} TO: #{TO.match(log).to_s.upcase}"
      info << str
    end
    info
  end
end
