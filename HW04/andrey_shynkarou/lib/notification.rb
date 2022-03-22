# frozen_string_literal: true

module Notification
  def read_file(filename)
    f = File.open(filename, 'r')
    f.each_line { |line| puts line }
    f.close
  end

  def write_to_file(filename, message)
    f = File.open(filename, 'a')
    f.write(message)
    f.close
  end
end
