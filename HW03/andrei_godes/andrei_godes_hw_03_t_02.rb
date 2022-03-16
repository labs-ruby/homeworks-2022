# frozen_string_literal: true

class Homework3
  IP = /(?>\d+\.){3}\d+/
  DATE = %r{\d+/\w+/(?>\d+:){3}\d+\s\S\d+}
  PATH = %r{/\w+/\d+/\w+}
  STR_FORMAT = %r{((?>\d+\.){3}\d+)((?>\s\S){2})\s\[\d+/\w+/(?>\d+:){3}\d+\s\S\d+\]\s\S\w+\s/\S+\s\w+\S+\s\d+\s\S+\s\S+}

  def task2(logs)
    format = logs.split("\n").select do |text|
      text[STR_FORMAT]
    end
    format.map { |output| "DATE: #{output[DATE]} FROM: #{output[IP]} TO: #{output[PATH].to_s.upcase}" }
  end
end
