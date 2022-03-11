# HW03/task3.rb
# frozen_string_literal: true

class Homework3
  def task3(logs)
    array_of_strings = logs.split(/\n/)
    if
    if logs.include?('Calling core')
      array_of_strings.select! { |line| line.include? 'Calling core' }
    end
      array_of_strings.map! { |p|
      data = p.split(' ')
      [data[0], data[1]].join(' ')
      }
      seconds = array_of_strings.map! { |i| i.chars.last(7) }
      i = 0
      while seconds.length >= i
        num1 = (seconds[i][3] + seconds[i][4] + seconds[i][5] + seconds[i][6]).to_f
        num2 = (seconds[i + 1][3] + seconds[i + 1][4] + seconds[i + 1][5] + seconds[i + 1][6]).to_f
        puts (60 - num1 + num2).round(1)
        i += 1
      end
    else
      puts '0'
    end
  end
end
homework3 = Homework3.new
homework3.task3("2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
")