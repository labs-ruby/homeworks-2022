# frozen_string_literal: true

class Homework3
  def initialize
    @line_match = %r{\s*\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3} - - \[\d{1,2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2} \+\d{4}\] "POST }
    @date_match = /(?<=\[)(.*)(?=\])/
    @ip_match = /\s*\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
    @routing_match = /(?<=POST ).*?(?= )/
  end

  def task2(log)
    log.lines
       .select { |s| s.match?(@line_match) }
       .map { |s| "DATE: #{s[@date_match]} FROM: #{s[@ip_match]} TO: #{s[@routing_match].upcase}" }
  end
end
