# frozen_string_literal: true

require_relative '../lib/notification'

RSpec.describe Notification do
  describe 'check notification' do
    context 'when notification has right parametrs' do
      it 'return notification' do
        expect(described_class.new('notification')).to be_instance_of(described_class)
      end
    end

    context 'when notification without the parameters' do
      it 'returns ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end
end
