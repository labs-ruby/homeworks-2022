# frozen_string_literal: true

# this is class Homework3
class Homework3
  def task4(log)
    letters = log.count('a-zA-Z')
    digits = log.count('0-9')
    { letters: letters, digits: digits }
  end
end
