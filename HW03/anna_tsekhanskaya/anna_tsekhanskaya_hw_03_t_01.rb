# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_01.rb

class Homework3
  def task1(logs)
    logs.split("\n").find { |el| el.include?('error') }.to_s
  end
end
