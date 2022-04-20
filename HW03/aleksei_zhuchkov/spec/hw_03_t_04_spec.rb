# frozen_string_literal: true

require_relative '../aleksei_zhuchkov_hw_03_t_04'

RSpec.describe Homework3 do
  let(:obj_hw3) { described_class.new }

  describe '#task4' do
    context 'when input data is empty' do
      let(:empty_data) { '' }

      it 'returns the instance of Hash class' do
        expect(obj_hw3.task4(empty_data)).to be_an_instance_of(Hash)
      end

      it 'returns the value 0 for numbers and letters' do
        expect(obj_hw3.task4(empty_data)).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when testing data include only letters' do
      let(:str_only_letters) { 'asDfgh' }
      let(:str_only_letters_up_case) { 'ASDQWEWW' }

      it 'returns right value letters "6"' do
        expect(obj_hw3.task4(str_only_letters)).to eq({ digits: 0, letters: 6 })
      end

      it 'returns right value letters "8"' do
        expect(obj_hw3.task4(str_only_letters_up_case)).to eq({ digits: 0, letters: 8 })
      end
    end

    context 'when testing data include only numbers' do
      let(:str_only_numbers) { '1234555' }

      it 'returns numbers of letters equal "0" and count of numbers' do
        expect(obj_hw3.task4(str_only_numbers)).to eq({ digits: 7, letters: 0 })
      end
    end

    context 'when testing data has different type letters and numbers' do
      let(:str_only_numbers) { '1234fffer555ere' }

      it 'returns numbers of letters equal "8" and count of numbers equal "7"' do
        expect(obj_hw3.task4(str_only_numbers)).to eq({ digits: 7, letters: 8 })
      end
    end

    context 'when testing data has different type letters and numbers and some specific symbols' do
      let(:str_only_numbers) { '123--()--FFF' }

      it 'returns numbers of letters equal "3" and count of numbers equal "3"' do
        expect(obj_hw3.task4(str_only_numbers)).to eq({ digits: 3, letters: 3 })
      end
    end
  end
end
