# frozen_string_literal: true

class Homework3
  def task2(log)
    output_array = []
    good_data_array = log.split("\n").select { |x| x.length in 65..100 }
    [] if good_data_array.size.zero?
    good_data_array.each do |x|
      x = x.split
      output_array << "DATE: #{x[3][1..]} #{x[4][0..4]} FROM: #{x[0]} TO: #{x[6].upcase}"
    end
    output_array
  end
end
