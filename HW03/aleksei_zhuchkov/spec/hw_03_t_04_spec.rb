# frozen_string_literal: true

require_relative '../aleksei_zhuchkov_hw_03_t_04'

RSpec.describe Homework3 do
  let(:obj_hw3) { described_class.new }

  describe '#task4' do
    context 'when testing basic things' do
      it 'returns instance of Hash class' do
        expect(obj_hw3.task4('')).to be_an_instance_of(Hash)
      end

      it 'returns value 0 for numbers and letters when get empty string' do
        expect(obj_hw3.task4('')).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when testing different kind of requests' do
      let(:str_only_letters) { 'asdfgh' }
      let(:str_only_numbers) { '12345' }

      it 'returns numbers of letters and "0" numbers' do
        expect(obj_hw3.task4(str_only_letters)).to eq({ digits: 0, letters: 6 })
      end

      it 'returns numbers of letters equal "0" and count of numbers' do
        expect(obj_hw3.task4(str_only_numbers)).to eq({ digits: 5, letters: 0 })
      end
    end
  end
end
