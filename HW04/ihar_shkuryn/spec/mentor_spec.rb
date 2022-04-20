# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/homework'
require_relative '../lib/notification'
require_relative 'spec_helper'
require 'byebug'

RSpec.describe Mentor do
  let(:name) { 'Jack' }
  let(:surname) { 'Gonsales' }
  let(:obj) { described_class.new(name: name, surname: surname) }
  let(:student) { Student.new(name: 'John', surname: 'Doe') }

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

  describe '#add_homework' do
    context 'when fields is correct' do
      let(:homework) { obj.add_homework(title: 'HW03', description: 'epam homework', student: student) }

      it 'returns an object of class Homework' do
        expect(homework).to be_an_instance_of(Homework)
      end

      it 'homework added to all_homeworks' do
        expect(student.homeworks_todo).to include(homework)
      end
    end
  end

  describe 'notification creation'
  context 'when notification created' do
    let(:notice) { Notification.new(title: 'HW03') }

    it 'returns an object of class Notification' do
      expect(notice).to be_an_instance_of(Notification)
    end

    it 'returns right title' do
      expect(notice.message[:title]).to eq('HW03')
    end

    it 'student notice added' do
      student.notices.push(notice)
      expect(student.notices).to include(notice)
    end
  end

  describe '#subscribe_to!' do
    it 'returns array of mentor subscriptions' do
      obj.subscribe_to!(student)
      expect(obj.subscriptions).to include(student)
    end
  end
end
