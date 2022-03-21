# frozen_string_literal: true

# anna_tsekhanskaya_hw_03_t_02.rb

class Homework3
  FORM = %r{\d{2}\.\d\.\d{3}\.\d{3}\s-\s-\s\[\S+\s\+\d{4}\]\s"POST\s/\S+\s\S+"\s\d+\s+\S+\s+\S+}
  DATE = /.*?\[([^)]*)\].*/
  TO = /.*?POST ([^)]*)\ HTTP.*/
  IP = /\d{2}\.\d\.\d{3}\.\d{3}/
  def task2(logs)
    logs.split("\n").map do |line|
      return [] unless line =~ FORM

      "DATE: #{line.match(DATE)[1]} FROM: #{line.match(IP)[0]} TO: #{line.match(TO)[1].upcase}"
    end
  end
end