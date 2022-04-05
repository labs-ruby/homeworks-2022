# frozen_string_literal: true

require_relative '../HW04/lib/mentor'
require_relative 'spec_helper'

RSpec.describe Mentor do
  let(:name) { 'Jack' }
  let(:surname) { 'Gonsales' }
  let(:obj) { described_class.new(name: name, surname: surname) }

  describe 'checking fields of instance' do
    context 'when fields is correct' do
      it 'returns instance of Mentor' do
        expect(obj).to be_an_instance_of(described_class)
      end

      it 'when name is correct' do
        expect(obj.name).to eq(name)
      end

      it 'when surname is correct' do
        expect(obj.surname).to eq(surname)
      end

      it 'when returns correct presentation' do
        expect(obj.presentation).to eq("#{name} #{surname}")
      end
    end
  end
end
