# frozen_string_literal: true

class Homework3
  def task1(input)
    input.lines.each do |line|
      return line if line.include? 'error'
    end
    ''
  end
end
