# frozen_string_literal: true

class Homework3
  REGEX = %r{^([\d+.\d+]+).*(?<=\[)(.*)(?=\]).*(?<=\s)((?:/\w+)*?)(?=\s).*$}
  def task2(log)
    log.split("\n").each_with_object([]) do |line, memo|
      line.scan(REGEX) do |ip, dt, fold|
        memo << "DATE: #{dt} FROM: #{ip} TO: #{fold.upcase}"
      end
    end
  end
end
