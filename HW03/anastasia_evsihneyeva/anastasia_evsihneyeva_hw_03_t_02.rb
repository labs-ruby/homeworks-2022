# frozen_string_literal: true

class Homework3
  DATE = /\[(.*)\]/
  FROM = /(.*)(?=\ - -)/
  TO = %r{/te(.*)(?=\ H)}
  def task2(logs)
    return [] if logs.nil?

    logs.split("\n")
        .select { |log| log.include?('POST') && log =~ /(.*) - - \[(.*)\] "(.*)" (.*)/ }
        .map { |log| "DATE: #{DATE.match(log)[1]} FROM: #{FROM.match(log)} TO: #{TO.match(log).to_s.upcase}" }
  end
end
