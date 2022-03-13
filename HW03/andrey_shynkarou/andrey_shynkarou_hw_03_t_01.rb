# frozen_string_literal: true

class Homework3

  def task1(log)
    log.lines
            .select { |s| s.include?('error') }
            .first.to_s.chomp
  end
end