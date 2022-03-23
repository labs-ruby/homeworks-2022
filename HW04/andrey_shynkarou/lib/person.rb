# frozen_string_literal: true

class Person
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end

  private

  def read_file(filename)
    f = File.open(filename, 'r')
    f.each_line { |line| puts line }
    f.close
  end

  def write_to_file(filename, message)
    f = File.open(filename, 'w')
    f.write(message)
    f.close
  end
end
