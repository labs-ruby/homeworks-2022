# frozen_string_literal: true

require_relative '../aleksei_zhuchkov_hw_03_t_01'

RSpec.describe 'Homework3' do
  let(:obj_hw3) { Homework3.new }

  describe 'testing basics things' do
    let(:input_data) { '' }

    it 'Check empty string' do
      expect(obj_hw3.task1(input_data)).to eq('')
    end

    it 'return value is a string type' do
      expect(obj_hw3.task1(input_data)).to be_an_instance_of(String)
    end

    it 'return string with error, wrote by downcase' do
      expect(obj_hw3.task1('error')).to eq('error')
    end

    it 'return string with error, wrote by upcase' do
      expect(obj_hw3.task1('ERROR')).to eq('ERROR')
    end
  end
end
