# frozen_string_literal: true

class Homework3
  def task4(str)
    { letters: str.scan(/[a-zA-Z]/).count, digits: str.scan(/\d/).count }
  end
end
