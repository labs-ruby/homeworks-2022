# frozen_string_literal: true

require 'date'
require_relative 'expressions'

class Homework3
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
