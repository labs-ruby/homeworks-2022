# frozen_string_literal: true

class Homework3
  def task1(data_log)
    array_data_log = data_log.split("\n")
    array_data_error = array_data_log.select { |el| el.to_s.downcase.include?('error') }
    array_data_error[0] || ''
  end
end
