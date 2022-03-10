# frozen_string_literal: true

class Homework3
  IP_REGEX = /^\S+/
  DATE_REGEX = /(?<=\[).+?(?=\])/
  HEAD_REGEX = /(?<=POST )\S+/

  def task2(data_log)
    result = []
    raise ArgumentError unless data_log.instance_of?(String)

    data_log.split(/\n/).each do |el|
      ip = el.match(IP_REGEX) || next
      date = el.match(DATE_REGEX) || next
      head = el.match(HEAD_REGEX).to_s.upcase || next
      result.push("DATE: #{date} FROM: #{ip} TO: #{head}")
    end
    result
  end
end
