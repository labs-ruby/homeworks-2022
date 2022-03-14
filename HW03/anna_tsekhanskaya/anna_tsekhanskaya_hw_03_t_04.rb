# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_04.rb

class Homework3
  def task4(logs)
    { letters: logs.count('a-zA-Z'), digits: logs.count('0-9') }
  end
end
