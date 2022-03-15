# frozen_string_literal: true

class Homework3
  CONDITION = %r{\S+\s-\s-\s\D\d+/\w+/\S+\s\+\S+\s\S+\s\S+\s\w+/\d\.\d"\s\d+\s\S+\s\S+}
  DATETIME = %r{\d{2}/\w{3}/\d{4}:\d{2}:\d{2}:\d{2}\s\+\d{4}}
  IP = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
  ADDRESS = %r{/\w*/\d*/\w*}
  def task2(log)
    rows = log.split("\n").select { |str| str.include?('POST') }
    rows.select { _1 == _1.scan(CONDITION).join }.map do |element|
      "DATE: #{element.scan(DATETIME).join} FROM: #{element.scan(IP).join} TO: #{element.scan(ADDRESS).join.upcase}"
    end
  end
end
