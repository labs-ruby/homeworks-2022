# frozen_string_literal: true

class Notification
  MESSAGE = {
    mark_as_read!: 'read all notifications',
    to_work!: 'is doing',
    add_answer!: 'was solved',
    to_check!: 'needs to check',
    add_homework: 'add_homework',
    accept!: 'is accepted',
    reject_to_work!: 'is rejected',
    subscribe_to!: 'is subscribed to'
  }.freeze

  def initialize; end

  def method_missing(name)
    MESSAGE[name]
  end
end
