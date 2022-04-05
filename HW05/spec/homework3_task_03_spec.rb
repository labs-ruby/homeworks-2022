# frozen_string_literal: true

require_relative '../HW03/ihar_shkuryn_hw_03_t_03'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'Log has wrong output' do
    context 'when log is a nil' do
      let(:log) { nil }

      it 'when log.nil?' do
        expect { obj.task3(log) }.to raise_error(ArgumentError, 'Only string are allowed')
      end
    end

    context 'when log is empty string' do
      let(:log) { '' }

      it 'output is a empty' do
        expect(obj.task3(log)).to eq('0')
      end
    end

    context 'when array in params' do
      let(:log) { ['error']  }

      it 'output is a empty' do
        expect { obj.task3(log) }.to raise_error(ArgumentError, 'Only string are allowed')
      end
    end

    context 'when log is boolean' do
      let(:log) { true }

      it 'log is a boolean' do
        expect { obj.task3(log) }.to raise_error(ArgumentError, 'Only string are allowed')
      end
    end

    context 'when is it array in log' do
      let(:log) { true }

      it 'output is a empty' do
        expect { obj.task3(log) }.to raise_error(ArgumentError, 'Only string are allowed')
      end
    end
  end

  # describe 'Log has right output' do
  #
  # end
end
