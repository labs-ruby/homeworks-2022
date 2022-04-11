# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Student do
  let(:title) { 'HW04' }
  let(:description) { 'description' }
  let(:student) { described_class.new(name: 'Alexey', surname: 'Shparun') }
  let(:mentor) { Mentor.new(name: 'Vasya', surname: 'Klapan') }
  let(:hw) { Homework.new(title, description, student, mentor) }

  describe 'add_answer!' do
    context 'when arguments is correct' do
      it 'return object of class' do
        expect(student.add_answer!(hw, 'some text')).to eq hw.answer_list
      end
    end

    context 'when no arguments given' do
      it 'returns ArgumentError' do
        expect { student.add_answer! }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'to_work!' do
    context 'when student take to work' do
      it 'return object of class' do
        expect { student.to_work!(hw) }.to change { student.notifications_list.length }.to(1)
      end
    end

    context 'when no arguments given' do
      it 'returns ArgumentError' do
        expect { student.to_work! }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'to_check!' do
    context 'when student ready to check' do
      it 'return object of class' do
        expect { student.to_check!(hw) }.to change { student.notifications_list.length }.to(1)
      end
    end

    context 'when no arguments given' do
      it 'returns ArgumentError' do
        expect { student.to_check! }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'mark_as_read!' do
    context 'when student marks as read' do
      before do
        student.to_work!(hw)
      end

      it 'return empty array' do
        expect { student.mark_as_read! }.to change(student, :notifications_list).to eq []
      end
    end
  end
end
