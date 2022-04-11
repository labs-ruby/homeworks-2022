# frozen_string_literal: true

require_relative '../lib/notification'

RSpec.describe Notification do
  context 'when create new notification' do
    it 'return notification as Notification class object' do
      expect(described_class.new(homework: 'Test homework', text: 'Test text')).to_be_instance_of(desribed_class)
    end
  end
end
