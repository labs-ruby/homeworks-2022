# frozen_string_literal: true

require_relative '../aleksei_zhuchkov_hw_03_t_01'

RSpec.describe Homework3 do
  let(:obj_hw3) { described_class.new }

  describe '#task1' do
    context 'when input data is empty string' do
      let(:input_data) { '' }

      it 'Check empty string' do
        expect(obj_hw3.task1(input_data)).to be_empty
      end

      it 'return value is a string type' do
        expect(obj_hw3.task1(input_data)).to be_an_instance_of(String)
      end
    end

    context 'when input data is not empy string' do
      context 'when input data have not error'
      let(:input_data) do
        <<~LOG
          [23/Apr/2018:20:30:39 +0300] "POST /gerroird/2/messages HTTP/1.1" 200 48 0.0498
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/evrrorent HTTP/1.1" 200 - 0.2277
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/erront HTTP/1.1" 200 - 0.2277
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        LOG
      end

      it 'return empty string' do
        expect(obj_hw3.task1(input_data)).to be_empty
      end

      it 'return instance of string' do
        expect(obj_hw3.task1(input_data)).to be_an_instance_of(String)
      end
    end

    context 'when input data have one error' do
      let(:input_data) do
        <<~LOG
          [23/Apr/2018:20:30:39 +0300] "POST /gerroird/2/messages HTTP/1.1" 200 48 0.0498
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/evrrorent HTTP/1.1" 200 - 0.2277
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/erroRnt HTTP/1.1" 200 - 0.2277
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        LOG
      end

      let(:right_data) do
        '[23/Apr/2018:20:30:42 +0300] "POST /grid/2/erroRnt HTTP/1.1" 200 - 0.2277'
      end

      it 'return string with error' do
        expect(obj_hw3.task1(input_data)).to eq(right_data)
      end
    end

    context 'when input data have some errors' do
      let(:input_data) do
        <<~LOG
          [23/Apr/2018:20:30:39 +0300] "POST /geRRorsird/2/messages HTTP/1.1" 200 48 0.0498
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/everrorent HTTP/1.1" 200 - 0.2277
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/erroRnt HTTP/1.1" 200 - 0.2277
          [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        LOG
      end

      let(:right_data) do
        '[23/Apr/2018:20:30:39 +0300] "POST /geRRorsird/2/messages HTTP/1.1" 200 48 0.0498'
      end

      it 'return first string with error' do
        expect(obj_hw3.task1(input_data)).to eq(right_data)
      end
    end
  end
end
