# frozen_string_literal: true

module Notification
  def notifications
    values = []
    @data[:notify].each do |i|
      i.each do |k, v|
        values << k
        puts "> #{v}" if k == false
      end
    end
    puts 'No new notifications' unless values.include? false
  end

  def mark_as_read!
    @data[:notify].each { |i| i[true] = i.delete false }
  end
end
