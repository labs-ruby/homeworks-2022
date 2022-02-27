# frozen_string_literal: true

require 'rspec'
require 'require_all'
require_relative 'spec_helper'
if File.exist?('HW02')
  require_all 'HW02'

  using MyArrayMethods

  RSpec.describe 'MyArrayMethods' do
    describe '#my_each' do
      context 'when block is given' do
        context 'when array is empty' do
          let(:array) { [] }

          it 'returns empty array' do
            expect(array.my_each {}).to eq([])
          end
        end

        context 'when array is not empty' do
          let(:array) { [1, 2, 3, 4, 5] }

          it 'returns array' do
            expect(array.my_each {}).to eq([1, 2, 3, 4, 5])
          end
        end
      end

      context 'when block is not given' do
        context 'when array is empty' do
          let(:array) { [] }

          it 'returns Enumerator object' do
            expect(array.my_each).to be_kind_of(Enumerator)
          end

          it 'returns Enumerator/array size = 0' do
            expect(array.my_each.to_a.size).to eq(0)
          end
        end

        context 'when array is not empty' do
          let(:array) { [1, 2, 3, 4, 5] }

          it 'returns Enumerator object' do
            expect(array.my_each).to be_kind_of(Enumerator)
          end

          it 'returns Enumerator/array size = 5' do
            expect(array.my_each.to_a.size).to eq(5)
          end
        end
      end
    end

    describe '#my_map' do
      context 'when block is given' do
        context 'when array is empty' do
          let(:array) { [] }

          it 'returns empty array' do
            expect(array.my_map { |element| element + 1 }).to eq([])
          end
        end

        context 'when array is not empty' do
          let(:array) { [1, 2, 3, 4, 5] }

          it 'returns modified array' do
            expect(array.my_map { |element| element + 2 }).to eq([3, 4, 5, 6, 7])
          end
        end
      end

      context 'when block is not given' do
        context 'when array is empty' do
          let(:array) { [] }

          it 'returns Enumerator object' do
            expect(array.my_map).to be_kind_of(Enumerator)
          end

          it 'returns Enumerator/array size = 0' do
            expect(array.my_each.to_a.size).to eq(0)
          end
        end

        context 'when array is not empty' do
          let(:array) { [1, 2, 3, 4, 5] }

          it 'returns Enumerator object' do
            expect(array.my_map).to be_kind_of(Enumerator)
          end

          it 'returns Enumerator/array size = 5' do
            expect(array.my_map.to_a.size).to eq(5)
          end
        end
      end
    end

    describe '#my_select' do
      context 'when block is given' do
        context 'when array is empty' do
          let(:array) { [] }

          it 'returns empty array' do
            expect(array.my_select(&:even?)).to eq([])
          end
        end

        context 'when array is not empty' do
          let(:array) { [1, 2, 3, 4, 5] }

          it 'returns modified array' do
            expect(array.my_select(&:even?)).to eq([2, 4])
          end
        end
      end

      context 'when block is not given' do
        context 'when array is empty' do
          let(:array) { [] }

          it 'returns Enumerator object' do
            expect(array.my_select).to be_kind_of(Enumerator)
          end

          it 'returns Enumerator/array size = 0' do
            expect(array.my_select.to_a.size).to eq(0)
          end
        end

        context 'when array is not empty' do
          let(:array) { [1, 2, 3, 4, 5] }

          it 'returns Enumerator object' do
            expect(array.my_select).to be_kind_of(Enumerator)
          end

          it 'returns Enumerator/array size = 5' do
            expect(array.my_select.to_a.size).to eq(5)
          end
        end
      end
    end
  end
end
