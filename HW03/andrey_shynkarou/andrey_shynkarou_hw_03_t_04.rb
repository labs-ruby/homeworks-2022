class Homework3
  def task4(s)
    h = {letters: 0, digits: 0}
    s.each_char do |item|
      h[:letters] = h[:letters] + 1 if item.match?(/[a-zA-Z]/)
      h[:digits] = h[:digits] + 1 if item.match?(/[\d]/)
    end
    h
  end
end