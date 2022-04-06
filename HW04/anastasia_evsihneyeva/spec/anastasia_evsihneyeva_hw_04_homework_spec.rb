# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/homework'

RSpec.describe Homework do
  context 'when creating an object of Homework class' do
    it 'returns right title' do
      homework_variable = described_class.new('title', 'description', 'student', 'mentor')
      expect(homework_variable.title).to eq 'title'
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
