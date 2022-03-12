# frozen_string_literal: true

class Homework3

  def task2(log)
    log.lines
            .select { |s| s.match?(/\s*\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3} \- \- \[\d{1,2}\/\w{3}\/\d{4}\:\d{2}\:\d{2}\:\d{2} \+\d{4}\] \"POST \/\w*\/\d\/\w*.*/) }
            .map { |s| ("DATE: " + s[/(?<=\[)(.*)(?=\])/] + " FROM: " + s[/\s*\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/] + " TO: " + s[/(?<=POST ).*?(?= )/].upcase) }
  end
end
# .map { |s| ("DATE:" + s[/\[.{26}/] + " FROM: " + s[/.{12}/]) + " TO: " + s[/POST .*?(?= )/].upcase }[\[].*[\]] [\[]+
# \s*\d{1, 3}\.\d{1, 3}\.\d{1, 3}\.\d{1, 3} - - \[\d{1, 2}\/\w{3}\/\d{4}\:\d{2}\:\d{2}\:\d{2} \+\d{4}\] \"POST \/\w*\/\d\/\w*.*