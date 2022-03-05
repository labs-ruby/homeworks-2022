# frozen_string_literal: true

class Homework3
  def task4(string, result = {})
    result[:letters] = string.downcase.count('a-z')
    result[:digits] = string.downcase.count('0-9')
    result
  end
end
