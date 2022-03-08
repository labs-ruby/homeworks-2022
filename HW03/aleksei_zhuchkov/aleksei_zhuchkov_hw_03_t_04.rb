# frozen_string_literal: true

class Homework3
  def task4(data_log = 'error')
    raise ArgumentError if data_log == 'error'

    count_digits = data_log.scan(/\d/).flatten.count
    count_letters = data_log.scan(/[a-zA-Z]/).flatten.count
    { letters: count_letters, digits: count_digits }
  end
end
