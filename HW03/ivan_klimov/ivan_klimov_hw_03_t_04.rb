# frozen_string_literal: true

class Homework3
  def task4(log)
    q_let = log.downcase.count('a-z')
    q_dig = log.count('0-9')
    { letters: q_let, digits: q_dig }
  end
end
