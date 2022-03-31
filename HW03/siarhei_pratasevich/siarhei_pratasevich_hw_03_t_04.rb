# frozen_string_literal: true

class Homework3
  def task4(log)
    raise TypeError, "expected an String, got #{log.class.name}" unless log.is_a?(String)

    { letters: log.count('a-zA-Z'), digits: log.count('0-9') }
  end
end
