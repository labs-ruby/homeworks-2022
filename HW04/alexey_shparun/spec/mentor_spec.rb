# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'Alexey', surname: 'Shparun') }
  let(:mentor) { described_class.new(name: 'Vasya', surname: 'Klapan') }
  let(:hw) { mentor.add_homework(title: 'HW04', description: 'description', student: student) }

  describe 'add_homework' do
    context 'when arguments is correct' do
      it 'return object of class' do
        expect(hw).to be_a(Homework)
      end
    end

    context 'when no arguments given' do
      it 'returns ArgumentError' do
        expect { mentor.add_homework }.to raise_error(ArgumentError)
      end
    end
  end

  describe 'subscribe_to' do
    context 'when mentor subscribe' do
      it 'return student list' do
        expect { mentor.subscribe_to!(student) }.to change(mentor, :student_list).to eq [student]
      end
    end
  end

  describe 'mark_as_read!' do
    context 'when mentor marks as read' do
      before do
        student.to_work!(hw)
      end

      it 'return empty array' do
        expect { mentor.mark_as_read! }.to change(mentor, :notifications_list).to eq []
      end
    end
  end

  describe 'accept!' do
    context 'when mentor accept' do
      it 'returns notifications with rejection' do
        expect { mentor.accept!(hw) }.to change { student.notifications_list.length }.to(1)
      end
    end
  end

  describe 'reject_to_work!' do
    context 'when mentor reject_to_work' do
      it 'returns notifications with rejection' do
        expect { mentor.reject_to_work!(hw) }.to change { student.notifications_list.length }.to(1)
      end
    end
  end
end
