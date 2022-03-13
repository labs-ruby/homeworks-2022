# frozen_string_literal: true

class Homework3
  def task1(log)
    log.split("\n").select { |item| item.include?('error') }[0].to_s
  end
end
