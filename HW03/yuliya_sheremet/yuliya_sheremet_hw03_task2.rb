# HW03/task2.rb
# frozen_string_literal: true

class Homework3
  def task2(logs)
    result = []
    logs.each_line do |i|
      ip, datetime, address = parse_line(i)
      if [ip, datetime, address].all?
        result << "DATE: #{datetime[1..-2]} FROM: #{ip[0..-4].strip} TO: #{address[1..-3].upcase}"
      end
    end
    puts result
  end

  def parse_line(data)
    ip = data[/^.* - -/]
    datetime = data[/\[.*\]/]
    address = data[/T .* H/]
    [ip, datetime, address]
  end
end
