# frozen_string_literal: true

require_relative '../ihar_shkuryn_hw_03_t_03'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'Log has wrong output' do
    context 'when log is not present' do
      let(:log) { nil }

      it 'when log.nil?' do
        expect { subject.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end

    context 'when log is empty string' do
      let(:log) { '' }

      it 'output is a empty' do
        expect(subject.task3(log)).to eq('0')
      end

      it 'returns a string type' do
        expect(subject.task3(log)).to be_an_instance_of(String)
      end
    end

    context 'when array in params' do
      let(:log) { ['error']  }

      it 'output is a empty' do
        expect { subject.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end

    context 'when log is boolean' do
      let(:log) { true }

      it 'log  is a boolean' do
        expect { subject.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end

    context 'when log is empty array' do
      let(:log) { []  }

      it 'returns TypeError in case log == array' do
        expect { subject.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end
  end
end
