# frozen_string_literal: true

class Homework3
  def task2(log)
    output_array = []
    good_data_array = log.split("\n").select { |x| x.length in 65..100 }
    good_data_array.each do |x|
      el = x.split
      output_array << "DATE: #{el[3][1..]} #{el[4][0..4]} FROM: #{el[0]} TO: #{el[6].upcase}"
    end
    output_array
  end
end
