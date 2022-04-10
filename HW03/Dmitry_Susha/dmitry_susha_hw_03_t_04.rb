# frozen_string_literal: true

class Homework3
  def task4(string)
    return { letters: 0, digits: 0 } unless string.is_a?(String)

    letters = string.count('a-zA-Z')
    digits = string.count('0-9')
    { letters: letters, digits: digits }
  end
end
