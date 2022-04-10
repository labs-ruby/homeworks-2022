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

  let(:student2) { Student.new(name: 'BOSS', surname: 'MATV') }

  let(:homework) { Homework.new(title: 'HW04', description: 'implementation classes structure', mentor: mentor, student: student) }

  let(:notification) { Notification.new(title: 'HW04', description: 'implementation classes structure') }

  describe '#initialize' do
    context 'when the object is created' do
      it 'returns surname' do
        expect(mentor.name).to eq('Boris')
      end

      it 'returns name' do
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
      it 'returns right object class ' do
        homework = mentor.add_homework(title: 'HW04', description: 'implementation classes structure', student: student)
        expect(homework.class).to eq(Homework)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when clear notifications' do
      it 'returns empty array ' do
        student.to_work!(homework)
        mentor.mark_as_read!
        expect(mentor.notifications).to eq([])
      end
    end
  end

  describe '#subscribe_to!' do
    context 'when mentor subscribe to student' do
      it 'push student to subscripptions array' do
        mentor.subscribe_to!(student)
        mentor.subscribe_to!(student2)
        expect(mentor.subscriptions.count).to eq(2)
      end
    end
  end

  describe '#reject_to_work!' do
    context 'when mentor rejects student`s homework' do
      it 'returns rejected status' do
        mentor.reject_to_work!(homework)
        expect(homework.status).to eq('rejected')
      end
    end
  end

  describe '#accept' do
    context 'when mentor accept student`s homework' do
      it 'returns accepted status' do
        mentor.accept!(homework)
        expect(homework.status).to eq('accepted')
      end
    end
  end
end
