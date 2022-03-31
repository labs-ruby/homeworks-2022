# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../siarhei_pratasevich_hw_03_t_01'

RSpec.describe Homework3 do
  subject { object.task1(log) }

  describe 'Log that has wrong output' do
    context 'when log is nil' do
      let(:log) { nil }

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end

    context 'when logs has wrong format' do
      let(:log) do
        <<~LOGS
          errorrrrrrrerrorrrrr, errorrrerrorrrrerrrerer
        LOGS
      end

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end
  end
end
