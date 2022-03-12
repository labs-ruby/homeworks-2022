# frozen_string_literal: true

class Homework3

  def task2(log)
    log.lines
            .select { |s| s.include?('POST') }
            .to_a
            .map { |s| ("DATE: " + s[/(?<=\[)(.*)(?=\])/] + " FROM: " + s[/.{12}/] + " TO: " + s[/(?<=POST ).*?(?= )/].upcase) }
  end
end
# .map { |s| ("DATE:" + s[/\[.{26}/] + " FROM: " + s[/.{12}/]) + " TO: " + s[/POST .*?(?= )/].upcase }[\[].*[\]] [\[]+