# frozen_string_literal: true

class Homework3
  def task4(string)
    result = { letters: 0, digits: 0 }
    string.split('').each do |i|
      result[:letters] += 1 if i.match(/^[[:alpha:]]$/)
      result[:digits] += 1 if i.match(/^[[:digit:]]$/)
    end
    result
  end
end
