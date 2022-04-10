# frozen_string_literal: true

require 'date'
require_relative 'expressions'

class Homework3
  # def task3(text)
  #   calling_core_requests = text.scan(Expressions::CALLING_CORE_REQUEST)

  #   return '0' if calling_core_requests.size.zero?

  #   flattened_calling_core_requests = calling_core_requests.flatten
  #   difference_between_dates = DateTime.parse(flattened_calling_core_requests[1])\
  # - DateTime.parse(flattened_calling_core_requests.first)
  #   p (difference_between_dates * 24 * 60 * 60).to_f.to_s
  # end

  NUMS = /(.*)(?=\ ub)/
  SPLIT = /[\ :-]/
  def task3(logs)
    return '0' if finding_logs(logs).length < 2

    logs = finding_dur(making_time(finding_logs(logs)))

    logs.length == 1 ? logs[0] : logs
  end

  private

  def finding_logs(logs)
    logs.split("\n").select { |log| log.include?('core with action') }
  end

  def making_time(logs)
    logs.map { |log| Time.gm(*NUMS.match(log).to_s.split(SPLIT).map(&:to_f)) }
  end

  def finding_dur(logs)
    (0..logs.length - 2).map { |i| (logs[i + 1] - logs[i]).round(1).to_s }
  end
end
