# frozen_string_literal: true

class Homework3
  def task2(data_log = 'error')
    result = []
    raise ArgumentError if data_log == 'error'

    data_log.split("\n").each do |el|
      ip = el.match(/^\S+/) || next
      date = el.match(/(?<=\[).+?(?=\])/) || next
      head = el.match(/POST (\S+)/) || next
      result.push("DATE: #{date} FROM: #{ip} TO: #{head[1].upcase}")
    end
    result
  end
end
