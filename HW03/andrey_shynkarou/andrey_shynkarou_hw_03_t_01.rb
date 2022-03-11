# frozen_string_literal: true

class Homework3

  def task1(log)
    answer = ''
    log.each_line do |s|
      if s.include?("error")
        answer = s.chomp
        break
      end
    end
    return answer
  end
end