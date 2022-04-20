# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'
require './matsvei_basiayeu_hw_03_t_04'

RSpec.describe Homework3 do
  subject { described_class.new.task4(logs) }

  describe 'count letters and digits in the string' do
    context 'when word consists digits and letters' do
      let(:logs) { '1245qwertyuiop' }

      it 'returns right number of letters and digits' do
        expect(subject).to eq({ digits: 4, letters: 10 })
      end
    end

    context 'when string is empty' do
      let(:logs) { '' }

      it 'returns number of letters=0 and digits=0' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string type is nil' do
      let(:logs) { nil }

      it 'returns number of letters is 0 and digits is 0' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string consists letters,symbols and digits' do
      let(:logs) { '123+._45/,w_45q-+_45./,wer./87,t' }

      it 'returns number of letters and digits' do
        expect(subject).to eq({ digits: 11, letters: 6 })
      end
    end

    context 'when check class' do
      let(:logs) { '1234567890ljklglkf' }

      it 'returns right object class ' do
        expect(subject).to be_a(Hash)
      end
    end
  end
end
