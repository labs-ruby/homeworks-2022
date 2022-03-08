class Homework3
  def task_1(input)
    for line in input.lines do
      if line.include? "error"
        return line
      end
    end
    ""
  end
end
