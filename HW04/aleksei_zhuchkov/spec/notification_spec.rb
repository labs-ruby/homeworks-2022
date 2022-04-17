# frozen_string_literal: true

require_relative '../lib/notification'

RSpec.describe Notification do
  let(:notification) { described_class.new('test title', 'test description') }

  describe '#title' do
    it 'return title' do
      expect(notification.title).to eq('test title')
    end
  end

  describe '#description' do
    it 'return description' do
      expect(notification.description).to eq('test description')
    end
  end

  describe 'notification' do
    context 'when method notification' do
      it 'when notification doesn\'t add' do
        expect(notification.get_notifications([])).to eq([])
      end

      it 'when add some notification' do
        test_arr = []
        test_arr << described_class.new('test title', 'test description')
        expect(described_class.new.get_notifications(test_arr)).to eq([['test title', 'test description']])
      end
    end
  end
end
