# HW03/task2.rb
# frozen_string_literal: true

class Homework3
  def task2(logs)
    array_of_strings = logs.split("\n")
    no_error = array_of_strings.reject! { |i| i.include?('error') }
    no_error.map! do |p|
      data = p.split(' ')
      ['DATE: ' + data[3].to_s.delete_prefix('['), data[4].to_s.delete_suffix(']'),
       + 'FROM: ' + data[0], + 'TO: ' + data[6].upcase].join(' ')
    end
    puts no_error
  end
end
