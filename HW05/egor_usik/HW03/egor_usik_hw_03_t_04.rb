require_relative 'expressions'

class Homework3
  def task4(text)
    { letters: count_letters_in(text), digits: count_digits_in(text) }
  end

  private

  def count_letters_in(text)
    text.scan(Expressions::LETTERS).count
  end

  def count_digits_in(text)
    text.scan(Expressions::DIGITS).count
  end
end
