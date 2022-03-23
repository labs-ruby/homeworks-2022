class Notification
  attr_accessor :title, :description, :read

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)

    @read = false
  end

  def unread?
    @read == false
  end

  def marked_as_read?
    @read
  end

  def mark_as_read
    @read = true
  end
end