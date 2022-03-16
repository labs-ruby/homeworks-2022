# frozen_string_literal: true

class Homework3
  def task4(random_string)
    { digits: random_string.count('0-9'), letters: random_string.count('a-zA-Z') }
  end
end
