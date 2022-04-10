# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'

RSpec.describe Homework do
  let(:title) { 'HW04' }
  let(:description) { 'description' }
  let(:mentor) { Mentor.new(name: 'Vasya', surname: 'Klapan') }
  let(:student) { Student.new(name: 'Alexey', surname: 'Shparun') }
  let(:hw) { described_class.new(title, description, student, mentor) }

  describe 'homework with the wrong parameters' do
    context 'when no arguments given' do
      it 'returns ArgumentError' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end

    context 'when not all arguments have been passed on' do
      it 'not all arguments' do
        expect { described_class.new(description, mentor, student) }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'homework that has right parametrs' do
    context 'when arguments is correct' do
      it 'check correct title' do
        expect(hw.title).to eq 'HW04'
      end

      it 'check correct description' do
        expect(hw.description).to eq 'description'
      end

      it 'check correct student' do
        expect(hw.student).to eq student
      end

      it 'check correct mentor' do
        expect(hw.mentor).to eq mentor
      end
    end
  end
end
