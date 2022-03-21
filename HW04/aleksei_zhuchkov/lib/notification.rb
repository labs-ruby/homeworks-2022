# frozen_string_literal: true

class Notification
  attr_reader :title, :description

  def initialize(title, description)
    @title = title
    @description = description
  end

  def print_notification
    puts "Title: #{title}, discription: #{description}"
  end


end
