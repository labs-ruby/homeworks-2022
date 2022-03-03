# frozen_string_literal: true

class Homework3
  def task3(log)
    return '0' if total_lines(log).size <= 1

    array = total_lines(log)
            .map { |element| element.scan(/\d+-\d+-\d+ \d{1,2}:\d{1,2}:\d{1,2}[.]\d/) }
            .flatten.map { |element| element.split(/[- :]/).map(&:to_f) }

    result_array(array).size == 1 ? result_array(array).join : result_array(array)
  end

  private

  def result_array(array, result = [])
    (array.size - 1).times do |index|
      result.push(Time.at(Time.gm(*array[index + 1]) - Time.gm(*array[index])).to_f.round(1).to_s)
    end
    result
  end

  def total_lines(log)
    log.split("\n").select { |string| string.include?('Calling core with action:') }
  end
end
