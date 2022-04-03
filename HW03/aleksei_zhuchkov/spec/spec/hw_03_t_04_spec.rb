# frozen_string_literal: true

require_relative '../../aleksei_zhuchkov_hw_03_t_04'

RSpec.describe 'Homework3' do
  let(:obj_hw3) { Homework3.new }

  context 'when testing basic things' do
    it 'return value is Hash type' do
      expect(obj_hw3.task4('')).to be_an_instance_of(Hash)
    end
  end
end
