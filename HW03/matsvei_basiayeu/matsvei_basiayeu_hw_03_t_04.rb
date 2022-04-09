# frozen_string_literal: true

# this is class Homework3
class Homework3
  def task4(log)
    return { letters: 0, digits: 0 } if log.instance_of?(NilClass)

    letters = log.count('a-zA-Z')
    digits = log.count('0-9')
    { letters: letters, digits: digits }
  end
end
