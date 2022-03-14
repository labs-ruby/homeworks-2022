# frozen_string_literal: true

class Homework3
  PESPONSE_REGEXP = %r{\d{2}\.\d\.\d{3}\.\d{3}\ -\ -\ \[\S+\ \+\d{4}\]\ "POST /\S+\ \S+"\ \d+\s+\S+\s+\S+}
  DATE_REGEXP = /.*?\[([^)]*)\].*/
  ADRESS_REGEXP = /.*?POST ([^)]*)\ HTTP.*/

  def task2(logs)
    logs.split("\n").select { |line| line =~ PESPONSE_REGEXP }.map do |line|
      "DATE: #{line.match(DATE_REGEXP)[1]} FROM: #{line[0..11]} TO: #{line.match(ADRESS_REGEXP)[1].upcase}"
    end
  end
end
