# frozen_string_literal: true

class Homework3
  def task4(str)
    { letters: str.count('a-z'), digits: str.count('0-9') }
  end
end
