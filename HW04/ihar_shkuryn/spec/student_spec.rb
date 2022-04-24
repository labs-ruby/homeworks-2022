# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/homework'
require_relative '../lib/notification'
require_relative 'spec_helper'
require 'byebug'

RSpec.describe Student do
  let(:name) { 'John' }
  let(:surname) { 'Doe' }
  let(:subject) { described_class.new(name: name, surname: surname) }

  describe 'checking fields of instance' do
    context 'when fields is correct' do
      it 'returns instance of Student' do
        expect(subject).to be_an_instance_of(described_class)
      end

      it 'when name is correct' do
        expect(subject.name).to eq(name)
      end

      it 'when returns correct presentation' do
        expect(subject.presentation).to eq("#{name} #{surname}")
      end
    end
  end

  describe '#notification' do
    context 'when student get notification' do
      it 'student notification is instance of array' do
        expect(subject.notices).to be_an_instance_of(Array)
      end
    end
  end
end
