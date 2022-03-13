# frozen_string_literal: true

class Homework3
  def task4(logs)
    { letters: logs.count(A - z), digits: logs.count('0-9') }
  end
end
