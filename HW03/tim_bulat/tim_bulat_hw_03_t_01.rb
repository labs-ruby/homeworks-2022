# frozen_string_literal: true

class ClassName
  def get_lines(log, key_word)
    log.split("\n").select { |line| line != '' && line.include?(key_word) }
  end

  def task1(log)
    err_log = get_lines(log, 'error')
    err_log.empty? ? '' : err_log
  end
end
