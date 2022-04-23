# frozen_string_literal: true

require_relative '../../lib/student'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'Sam', surname: 'Smith') }

  describe '#initialize' do
    context 'when no arguments are given' do
      it 'returns an error' do
        expect { student.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#homeworks' do
    context 'when no arguments are given' do
      it 'returns nil' do
        expect(student).to be_nil
      end
    end
  end
end
