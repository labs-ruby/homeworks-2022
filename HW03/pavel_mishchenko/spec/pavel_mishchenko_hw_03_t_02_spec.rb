# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../pavel_mishchenko_hw_03_t_02'

RSpec.describe Homework3 do
  subject { described_class.new.task2(log) }

  describe 'Log that has wrong output' do
    context 'when log is not String class' do
      let(:log) { 404 }

      it 'returns ArgumentError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end
end
