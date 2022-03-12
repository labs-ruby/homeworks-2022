# frozen_string_literal: true

class Homework3
  REG_TIME = /\d{2}:\d{2}\.\d/

  def task3(log)
    return '0' unless if_log_valid(log)

    times = make_array_time(log)
    arr = []
    (times.size - 1).times do |i|
      arr.append (times[i + 1] - times[i]).abs.round(1).to_s
    end
    return arr.first if arr.size == 1

    arr
  end

  def if_log_valid(log)
    log.sub('Calling core with action:', '').include? 'Calling core with action:'
  end

  def make_array_time(log)
    log.lines.map do |line|
      time = line.include?('Calling core with action:') ? line[REG_TIME] : nil
      (time[0, 2] == '00' ? 60.0 : time[0, 2].to_f) * 60.0 + time[3, 7].to_f unless time.nil?
    end.compact
  end
end
