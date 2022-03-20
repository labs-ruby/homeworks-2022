# frozen_string_literal: true

require_relative 'file_manager'
module Notification
  include FileManager
  def add_notification(user, data = '')
    add_data(folder(user), 'notification.txt', "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} #{data}")
  end

  def notifications
    File.open("#{folder(self)}/notification.txt") do |file|
      file.each { |line| puts line unless line.include?("\u{2714}") }
    end
  end

  def mark_as_read!
    file = File.read("#{folder(self)}/notification.txt")
    new_content = file.split("\n")
    new_content = new_content.map { |line| line.include?("\u{2714}") ? line : line.concat(" \u{2714}") }.join("\n")
    File.open("#{folder(self)}/notification.txt", 'w') { |line| line.puts new_content }
  end

  def folder(user)
    "#{user.name}_#{user.surname}"
  end
end
