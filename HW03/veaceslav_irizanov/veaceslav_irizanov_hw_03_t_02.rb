# frozen_string_literal: true

class Homework3
  CONDITION_ERROR = 'ERROR'
  CONDITION = %r{\S+\s-\s-\s\D\d+/\w+/\S+\s\+\S+\s\S+\s\S+\s\w+/\d\.\d"\s\d+\s\S+\s\S+}
  DATETIME = %r{\d{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d{4}}
  IP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
  ADRESS = %r{/\w*/\d*/\w*}
  def task2(log)
    rows = log.split("\n").delete_if { |str| str.include?(CONDITION_ERROR) }
    rows.map do |element|
      return [] unless element == element.scan(CONDITION).join

      "DATE: #{element.scan(DATETIME).join} FROM: #{element.scan(IP).join} TO: #{element.scan(ADRESS).join.upcase}"
    end
  end
end
