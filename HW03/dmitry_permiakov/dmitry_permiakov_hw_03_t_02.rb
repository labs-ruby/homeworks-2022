# frozen_string_literal: true

class Homework3
  def task2(logs)
    logs.split("\n").select { |v| v.include? 'POST' }.map do |x|
      x = x.split(' ')
      return [] if x[3][0] != '['

      "DATE: #{x[3][1..]} #{x[4][0..-2]} FROM: #{x[0]} TO: #{x[6].upcase}"
    end
  end
end
