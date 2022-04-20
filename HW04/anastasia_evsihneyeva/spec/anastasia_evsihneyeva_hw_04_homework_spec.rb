# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../../../spec/spec_helper'

RSpec.describe Homework do
  subject { described_class.new('title', 'description', 'student', 'mentor') }

  context 'when creating an object of Homework class' do
    it 'returns right title' do
      expect(subject.title).to eq 'title'
    end
  end

  context 'when creating class object without/with not full parameters' do
    it 'returns an ArgumentError' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'returns an error' do
      expect { described_class.new('title', 'description') }.to raise_error(ArgumentError)
    end
  end
end
