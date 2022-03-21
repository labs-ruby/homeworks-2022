# frozen_string_literal: true

module StudentHomework
  def homeworks
    @data[:homeworks].each do |i|
      i.each do |k, v|
        puts "Not started > #{v}" if k == false
        puts "Started > #{v}" if k == true
      end
    end
  end
end
