# frozen_string_literal: true

require_relative '../lib/notification'

RSpec.describe Notification do
  notification { described_class.new(title: "Notification's title", description: "Notification's description") }

  describe '#title' do
    it 'notification has title' do
      expect(notification.title).to eq("Notification's title")
    end
  end

  describe '#description' do
    it 'notification has description' do
      expect(notification.description).to eq("Notification's description")
    end
  end
end
