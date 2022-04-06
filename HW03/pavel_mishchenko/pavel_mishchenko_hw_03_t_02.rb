# frozen_string_literal: true

REGEX_IP = /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/
REGEX_DATE = %r{(\[\d+/\w+/\d+:\d+:\d+:\d+ \+\d{4}\])}
REGEX_MESSAGE = /(".+")/
class Homework3
  def task2(str)
    raise ArgumentError unless str.is_a?(String)

    post_requests_log = post_requests(str)
    if post_requests_log.empty?
      post_requests_log
    else
      post_requests_log.map do |e|
        "DATE: #{process_date(e)} FROM: #{match_ip(e)} TO: #{process_message(e)}"
      end
    end
  end

  private

  def process_date(str)
    str.match(REGEX_DATE).to_s.delete('[]')
  end

  def match_ip(str)
    str.match(REGEX_IP)
  end

  def process_message(str)
    str.match(REGEX_MESSAGE).to_s.split.slice(1).upcase
  end

  def post_requests(str)
    str.lines(chomp: true).select { |line| line.match?(Regexp.new("#{REGEX_IP} - - #{REGEX_DATE} #{REGEX_MESSAGE}")) }
  end
end
