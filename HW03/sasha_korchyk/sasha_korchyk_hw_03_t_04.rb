# frozen_string_literal: true

class Homework3
  def task4(str)
    { letters: str.scan(/[a-zA-Z]/).length, digits: str.scan(/[1-9]/).length }
  end
end
