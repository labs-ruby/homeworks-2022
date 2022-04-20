# frozen_string_literal: true

require_relative '../../lib/person'

# rubocop:disable Metrics/BlockLength
RSpec.describe Person do
  subject(:create) { described_class.new(name: 'John', surname: 'Doe') }

  describe '#initialize' do
    context 'when no arguments are given' do
      let(:user_with_no_params) { described_class.new }

      it 'returns an error' do
        expect { user_with_no_params.subscriptions }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#fullname' do
    it 'returns name and surname' do
      expect(create.fullname).to eq('John Doe')
    end
  end

  describe '#notifications' do
    context 'when subject has no notifications' do
      it 'returns an empty array' do
        expect(create.notifications).to eq([])
      end
    end

    context 'when subject has one notification' do
      let(:notification_class) { Notification.new('Test', 'Test notification') }

      it 'returns array of notifications' do
        create.send(:add_notification, notification_class)
        expect(create.notifications.first).to eq(notification_class)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when subject reads all notifications' do
      let(:notification_class) { Notification.new('Test', 'Test notification') }

      it 'returns an empty array' do
        # notification = instance_double("Notification", :title => 'Test', :description => 'Test notification')
        create.send(:add_notification, notification_class)
        create.mark_as_read!
        expect(create.notifications).to eq([])
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
