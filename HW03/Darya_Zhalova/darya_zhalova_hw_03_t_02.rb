# frozen_string_literal: true

class Homework3
  REG_DATE = %r{\d{2}/\w+/20\d{2}:\d{2}:\d{2}:\d{2} \+\d{4}}
  REG_ADR = /\d{2}\.\d\.\d{3}\.\d{3}/
  REG_PATH = %r{/test/2/\w+}

  def task2(log)
    log.lines.map do |line|
      "DATE: #{line[REG_DATE]} FROM: #{line[REG_ADR]} TO: #{line[REG_PATH].upcase}" unless line.include? 'ERROR'
    end.compact
  end
end
