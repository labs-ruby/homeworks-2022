# frozen_string_literal: true

# get log as a string and return a hash containing count digits and letters
class Homework3
  def task4(log)
    raise ArgumentError, 'Only string are allowed' unless log.is_a?(String)

    letters_count = log.count('a-zA-Z')
    digits_count = log.count('0-9')
    { letters: letters_count, digits: digits_count }
  end
end
