# frozen_string_literal: true

class ClassName
  IP_REGEX = /\b(?:\d{1,3}\.){3}\d{1,3}\b/
  DATE_REGEX = /\[.*?\]/
  TO_REGEX = /".*?"/

  def get_lines(log, key_word)
    log.split("\n").select { |line| line != '' && line.include?(key_word) }
  end

  def task2(log)
    err_log = get_lines(log, 'POST')
    err_log.map do |line|
      "DATE: #{line[DATE_REGEX].delete('[]')} "\
      "FROM: #{line[IP_REGEX]} "\
      "TO: #{line[TO_REGEX].delete!('POST').split[1].upcase}"
    end
  end
end
