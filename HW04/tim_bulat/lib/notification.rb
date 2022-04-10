# frozen_string_literal: true

module Notification
  attr_accessor :notes

  def notifications
    if notes.empty?
      print "You don't have new notifications\n"
    else
      notes.each { |note| print note }
    end
  end

  def mark_as_read!
    notes.clear
  end
end
