# frozen_string_literal: true

class Homework3
  def get_lines(log, key_word)
    log.split("\n").select { |line| line != '' && line.include?(key_word) }
  end

  def task4(str)
    { letters: str.count('[a-zA-Z]'), digits: str.count('[0-9]') }
  end
end
