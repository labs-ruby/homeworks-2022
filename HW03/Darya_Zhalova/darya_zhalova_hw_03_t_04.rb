class Homework3
  def task4(str)
    answer = {
      :letters => str.count('a-z'),
      :digits => str.count('0-9')
    }
  end

end

hw = Homework3.new

puts hw.task4("wicked .. !")