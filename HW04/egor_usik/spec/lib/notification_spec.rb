# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe Notification do
  subject(:create) { described_class.new('Test', 'Test notification') }

  describe '#initialize' do
    context 'with no args' do
      it 'returns an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#unread?' do
    context 'when created subject is unread' do
      it 'returns true' do
        expect(create.unread?).to be true
      end
    end

    context 'when mark as read subject and check it is unread' do
      it 'returns false' do
        create.mark_as_read!
        expect(create.unread?).to be false
      end
    end

    context 'when read subject then mark as unread and check it is unread' do
      it 'returns true' do
        create.mark_as_read!
        create.mark_as_unread!
        expect(create.unread?).to be true
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when subject is marked as read' do
      it 'returns true' do
        expect(create.mark_as_read!).to be true
      end
    end

    context 'when subject that is actually read marked as read again' do
      it 'returns true' do
        create.mark_as_read!
        expect(create.mark_as_read!).to be true
      end
    end
  end

  describe '#mark_as_unread!' do
    context 'when subject is marked as unread' do
      it 'returns false' do
        expect(create.mark_as_unread!).to be false
      end
    end

    context 'when subject that is actually unread marked as unread secondly' do
      it 'returns false' do
        create.mark_as_unread!
        expect(create.mark_as_unread!).to be false
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
