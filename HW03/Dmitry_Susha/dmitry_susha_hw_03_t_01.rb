# frozen_string_literal: true

class Homework3
  def task1(logs)
    logs.split("\n").select { |string| string.downcase.include?('error') }[0].to_s
  end
end
