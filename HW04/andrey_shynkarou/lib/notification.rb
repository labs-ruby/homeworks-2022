# frozen_string_literal: true

module Notification
  def read_file(filename)
    f = File.open(filename, 'r')
    f.each_line { |line| puts line }
    f.close
  end
  
end
