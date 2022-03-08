# frozen_string_literal: true

class Homework3
  def clear_lines_to_time(arr)
    puts arr.class
    arr.map{|el| el = el.to_s.match(/^.+?(?=\s).+?(?=\s)/)}
      .map{|el| el = el.to_s.scan(/\d+\.?\d/).flatten}
      .map{|el| el = Time.new(el[0], el[1], el[2], el[3], el[4], el[5].to_f)}   
  end

  def changing_time(arr)
    result = []
    index = 1
    while index < arr.length do
      result << format("%.1f", arr[index] - arr[index - 1])
      index += 1
    end
    return result[0] if result.size == 1
    result
  end
  # def clear_lines(arr)
  #   puts arr.class
  #   date_time = []; result = []; index = 1
  #   arr.each{|el| date_time << el.to_s.match(/^.+?(?=\s).+?(?=\s)/) }
  #   date_time = date_time.map{|el| el = el.to_s.scan(/\d+\.?\d/).flatten}
  #   puts date_time = date_time.map{|el| el = Time.new(el[0], el[1], el[2], el[3], el[4], el[5].to_f)}   
  #   while index < date_time.length do
  #     result << format("%.1f", date_time[index] - date_time[index - 1])
  #     index += 1
  #   end
  #   result
  # end

  def task3(data_log)
    array_with_call = data_log.split("\n").select{|el| el.include?("Calling core with action:")}
    return "0" if array_with_call.length <= 1
    
    correct_lines = clear_lines_to_time(array_with_call)
    changing_time(correct_lines)
  end
  # def task3(data_log)
  #   array_with_call = data_log.split("\n").select{|el| el.include?("Calling core with action:")}
  #   return "0" if array_with_call.length <= 1
    
  #   date_corr = clear_lines_to_time(array_with_call)
  #   return date_corr[0] if date_corr.length == 1
  #   date_corr
  # end
end
# Time.new(2018, 04, 23, 17, 18, 38.8)


# 2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
# 2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
# 2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
# 2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
# 2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages