# frozen_string_literal: true

class Homework3
  def task4(text)
    { letters: text.count('a-zA-Z'), digits: text.count('1-9') }
  end
end
