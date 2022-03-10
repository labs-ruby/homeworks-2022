# frozen_string_literal: true

class Homework3
  def task4(data_log)
    raise ArgumentError unless data_log.instance_of?(String)

    count_digits = data_log.count '0-9'
    count_letters = data_log.downcase.count 'a-z'
    { letters: count_letters, digits: count_digits }
  end
end
