# frozen_string_literal: true

class Homework3
  def task4(string)
    { digits: string.count('0-9'), letters: string.count('a-z') }
  end
end
