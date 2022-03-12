# frozen_string_literal: true

# this is class Homework3
class Homework3
  LET_REGEX = /[a-z]/
  DIGITS_REGEX = /\d/
  def task4(log)
    { letters: log.downcase.scan(LET_REGEX).count, digits: log.scan(DIGITS_REGEX).count }
  end
end
