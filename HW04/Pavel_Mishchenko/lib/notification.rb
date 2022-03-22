# frozen_string_literal: true

class Notification
  attr_reader :title, :description
  attr_accessor :status

  def initialize(title:, description:)
    @title = title
    @description = description
    @status = 'unread'
  end
end
