# frozen_string_literal: true

class Homework3
  def task1
    split("\n").select { |v| v.include? 'error' }
  end
end
