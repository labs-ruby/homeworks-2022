# frozen_string_literal: true

require_relative '../lib/notification'

RSpec.describe Notification do
  let(:notification) { described_class.new('test title', 'test description') }
  let(:test_arr) { [] }

  describe '#get_notifications' do
    context 'when notifications do not add' do
      it 'return empty array' do
        expect(notification.get_notifications([])).to be_empty
      end

      it 'returns instance of Array class' do
        expect(notification.get_notifications([])).to be_an_instance_of(Array)
      end
    end

    context 'when notifications add' do
      let(:random_number) { rand(1..10) }

      it 'returns the array with notifications' do
        test_arr << notification
        expect(described_class.new.get_notifications(test_arr)).to eq([['test title', 'test description']])
      end

      it 'returns right length of array notifications' do
        random_number.times { test_arr << notification }
        expect(described_class.new.get_notifications(test_arr).length).to eq(random_number)
      end
    end
  end
end
