# frozen_string_literal: true
class Homework3
  def task1(data_log)
    data_log.split(/\n/).find{ |el| el.to_s.downcase.include?('error') } || ""
  end
end
