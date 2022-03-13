require 'time'
class Homework3
  def task3(log)

    def event_time(log)
      log.lines
              .select { |s| s.include?('action')}
              .map { |s| s[/\d{4}\-\d{2}\-\d{2} \d{2}\:\d{2}\:\d{2}\.\d/] }
              .map { |s| Time.parse(s) }
    end
    def subtract_time(log_time)
      a = log_time.each_with_index.map { |x, i| (log_time[i+1]-x).to_s if (i < (log_time.length - 1)) }
                                  .select.with_index { |x, i| i != (log_time.length-1) }

      return a.first if a.length == 1
      a if a.length != 1
    end

    event_time(log).length <= 1 ? "0" : subtract_time(event_time(log))

  end
end