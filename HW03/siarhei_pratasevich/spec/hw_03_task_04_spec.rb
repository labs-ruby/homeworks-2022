# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../siarhei_pratasevich_hw_03_t_04'

RSpec.describe Homework3 do
  subject { described_class.new.task4(log) }

  describe 'counter of letters and digits in the string' do
    context 'when log is a String class' do
      let(:log) { '12345qwert' }

      it 'returns object of Hash class' do
        expect(subject).to be_kind_of(Hash)
      end
    end

    context 'when word consists letters,symbols and digits include 0' do
      let(:log) { '000123_45q000-+=**,fghji' }

      it 'returns number of letters and digits' do
        expect(subject).to eq({ digits: 11, letters: 6 })
      end
    end

    context 'when log object is not String class' do
      let(:log) { nil }

      it 'returns TypeError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end
end
