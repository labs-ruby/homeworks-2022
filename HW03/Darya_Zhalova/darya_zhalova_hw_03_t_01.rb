# frozen_string_literal: true

class Homework3
  def task_1(input)
    input.lines.each do
      return line if line.include? 'error'
    end
    ''
  end
end
