# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'
require './lib/homework'
require './lib/mentor'
require './lib/notification'
require './lib/student'

RSpec.describe Student do
  let(:mentor) { Mentor.new(name: 'Alexanger', surname: 'Shagov') }

  let(:student) { described_class.new(name: 'Matsvei', surname: 'Basiayeu') }

  let(:homework) { Homework.new(title: 'HW04', description: 'implementation classes structure', mentor: mentor, student: student) }

  let(:notification) { Notification.new(title: 'HW04', description: 'implementation classes structure') }

  describe '#initialize' do
    context 'when the object is created' do
      it 'returns name' do
        expect(student.name).to eq('Matsvei')
      end

      it 'returns surname' do
        expect(student.surname).to eq('Basiayeu')
      end

      it 'returns subscriptions' do
        expect(student.homeworks).to eq([])
      end

      it 'returns notifications' do
        expect(student.notifications).to eq([])
      end
    end
  end

  describe '#to_work' do
    context 'when student start homework' do
      it 'push homework to homeworks array' do
        expect { student.to_work!(homework) }.to change { student.homeworks.count }.to(1)
      end

      it 'send notification to the mentor' do
        expect { student.to_work!(homework) }.to change { mentor.notifications.count }.to(1)
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { student.to_work! }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when mentor send notification to the student' do
      before do
        mentor.reject_to_work!(homework)
      end

      it 'returns empty array ' do
        expect { student.mark_as_read! }.to change { student.notifications.count }.to(0)
      end
    end
  end

  describe '#add_answer!' do
    context 'when student adds answer' do
      it 'push answer to answers array' do
        expect { student.add_answer!(homework, 'new answer') }.to change { homework.answers.count }.to(1)
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { student.add_answer! }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#send_to_check!' do
    context 'when student sends completed homework' do
      it 'send motification to the mentor ' do
        expect { student.send_to_check!(homework) }.to change { mentor.notifications.count }.to(1)
      end
    end

    context 'when wrong parameter' do
      it 'returns argument error' do
        expect { student.send_to_check! }.to raise_error(ArgumentError)
      end
    end
  end
end
