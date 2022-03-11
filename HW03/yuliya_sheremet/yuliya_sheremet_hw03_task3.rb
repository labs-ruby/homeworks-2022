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
