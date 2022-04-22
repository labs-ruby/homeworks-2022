# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'
require './lib/homework'
require './lib/mentor'
require './lib/notification'
require './lib/student'

RSpec.describe Mentor do
  let(:mentor) { described_class.new(name: 'Boris', surname: 'Tsarikov') }

  let(:student) { Student.new(name: 'Matsvei', surname: 'Basiayeu') }

  let(:homework) { Homework.new(title: 'HW04', description: 'implementation classes structure', mentor: mentor, student: student) }

  let(:notification) { Notification.new(title: 'HW04', description: 'implementation classes structure') }

  describe '#initialize' do
    context 'when the object is created' do
      it 'returns name' do
        expect(mentor.name).to eq('Boris')
      end

      it 'returns surname' do
        expect(mentor.surname).to eq('Tsarikov')
      end

      it 'returns subscriptions' do
        expect(mentor.subscriptions).to eq([])
      end

      it 'returns notifications' do
        expect(mentor.notifications).to eq([])
      end
    end
  end

  describe '#add_homework' do
    context 'when the object is created' do
      it 'returns right object class' do
        homework = mentor.add_homework(title: 'HW04', description: 'implementation classes structure', student: student)
        expect(homework.class).to eq(Homework)
      end

      it 'send notification to the student ' do
        expect { mentor.add_homework(title: 'HW04', description: 'implementation classes structure', student: student) }
          .to change { student.notifications.count }.to(1)
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { mentor.add_homework }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when clear notifications' do
      before do
        student.to_work!(homework)
      end

      it 'returns empty array ' do
        expect { mentor.mark_as_read! }.to change { mentor.notifications.count }.to(0)
      end
    end
  end

  describe '#subscribe_to!' do
    context 'when mentor subscribe to student' do
      it 'push student to subscriptions array' do
        expect { mentor.subscribe_to!(student) }.to change { mentor.subscriptions.count }.to(1)
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { mentor.subscribe_to! }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#reject_to_work!' do
    context 'when mentor rejects student`s homework' do
      it 'send notification to the student' do
        expect { mentor.reject_to_work!(homework) }.to change { student.notifications.count }.to(1)
      end

      it 'returns new status' do
        mentor.reject_to_work!(homework)
        expect(homework.status).to eq('rejected')
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { mentor.reject_to_work! }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#accept' do
    context 'when mentor accept student`s homework' do
      it 'send notification to the student' do
        expect { mentor.accept!(homework) }.to change { student.notifications.count }.to(1)
      end

      it 'returns new status' do
        mentor.accept!(homework)
        expect(homework.status).to eq('accepted')
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { mentor.accept! }.to raise_error(ArgumentError)
      end
    end
  end
end
