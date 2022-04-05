# frozen_string_literal: true

require_relative '../../aleksei_zhuchkov_hw_03_t_03'

RSpec.describe 'Homework3' do
  let(:obj_hw3) { Homework3.new }

  context 'when testing basic things' do
    it 'return value is string type' do
      expect(obj_hw3.task3('')).to be_an_instance_of(String)
    end

    it 'return value "0" (string) when get empty string' do
      expect(obj_hw3.task3('')).to eq('0')
    end
  end
end
