# frozen_string_literal: true

class Homework3
  def task4(logs)
    let = logs.count('A-z')
    dig = logs.count('0-9')
    "digits: #{dig}, letters: #{let}"
  end
end
