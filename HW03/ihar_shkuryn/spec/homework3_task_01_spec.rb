# frozen_string_literal: true

require_relative '../ihar_shkuryn_hw_03_t_01'

RSpec.describe Homework3 do
  describe 'Unnormal log' do
    let(:subject) { described_class.new }

    context 'when log is a nil' do
      let(:log) { nil }

      it 'output is a empty' do
        expect(subject.task1(log)).to eq('')
      end
    end

    context 'when got array in params' do
      let(:log) { ['error']  }

      it 'output is a empty' do
        expect(subject.task1(log)).to eq('')
      end
    end
  end

  describe 'Normal log' do
    let(:subject) { described_class.new }

    context 'when log has keyword in upper case' do
      let(:log) { 'ERROR' }

      it 'output is a empty' do
        expect(subject.task1(log)).to eq('')
      end

      it 'returns a string type' do
        expect(subject.task1(log)).to be_an_instance_of(String)
      end
    end
  end
end
