# frozen_string_literal: true

require_relative 'expressions'

class Homework3
  # def task2(text)
  #   text.scan(Expressions::POST_REQUEST).map! do |_req|
  #     "DATE: #{Regexp.last_match(2)} FROM: #{Regexp.last_match(1)} TO: #{Regexp.last_match(3).upcase}"
  #   end
  # end

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
