# frozen_string_literal: true

require_relative '../../lib/notification'

# rubocop:disable Metrics/BlockLength
RSpec.describe Notification do
  subject { described_class.new('Test', 'Test notification') }

  describe '#initialize' do
    context 'with no args' do
      it 'returns an error' do
        expect { notification }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#unread?' do
    context 'when created subject is unread' do
      it 'returns true' do
        expect(notification.unread?).to be true
      end
    end

    context 'when mark as read subject and check it is unread' do
      it 'returns false' do
        notification.mark_as_read!
        expect(notification.unread?).to be false
      end
    end

    context 'when read subject then mark as unread and check it is unread' do
      it 'returns true' do
        notification.mark_as_read!
        notification.mark_as_unread!
        expect(notification.unread?).to be true
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when subject is marked as read' do
      it 'returns true' do
        expect(notification.mark_as_read!).to be true
      end
    end

    context 'when subject that is actually read marked as read again' do
      it 'returns true' do
        notification.mark_as_read!
        expect(notification.mark_as_read!).to be true
      end
    end
  end

  describe '#mark_as_unread!' do
    context 'when subject is marked as unread' do
      it 'returns false' do
        expect(notification.mark_as_unread!).to be false
      end
    end

    context 'when subject that is actually unread marked as unread secondly' do
      it 'returns false' do
        notification.mark_as_unread!
        expect(notification.mark_as_unread!).to be false
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
