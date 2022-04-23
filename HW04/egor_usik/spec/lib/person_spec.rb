# frozen_string_literal: true

require_relative '../../lib/person'

# rubocop:disable Metrics/BlockLength
RSpec.describe Person do
  let(:person) { described_class.new(name: 'John', surname: 'Doe') }

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
      expect(person.fullname).to eq('John Doe')
    end
  end

  describe '#notifications' do
    context 'when subject has no notifications' do
      it 'returns an empty array' do
        expect(person.notifications).to eq([])
      end
    end

    context 'when subject has one notification' do
      let(:notification_class) { Notification.new('Test', 'Test notification') }

      it 'returns array of notifications' do
        person.send(:add_notification, notification_class)
        expect(person.notifications.first).to eq(notification_class)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when subject reads all notifications' do
      let(:notification_class) { Notification.new('Test', 'Test notification') }

      it 'returns an empty array' do
        person.add_notification(notification_class)
        person.mark_as_read!
        expect(person.notifications).to eq([])
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
