# frozen_string_literal: true

class Homework3
  def initialize
    @ERROR = 'error'
  end
  def task1(log)
    log.lines
            .select { |s| s.include?(@ERROR) }
            .first.to_s.chomp
  end
end