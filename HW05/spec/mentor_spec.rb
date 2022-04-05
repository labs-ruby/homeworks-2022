# frozen_string_literal: true

require_relative '../HW04/lib/mentor'
require_relative '../HW04/lib/student'
require_relative '../HW04/lib/homework'
require_relative '../HW04/lib/notification'
require_relative 'spec_helper'
require 'byebug'

RSpec.describe Mentor do
  let(:name) { 'Jack' }
  let(:surname) { 'Gonsales' }
  let(:obj) { described_class.new(name: name, surname: surname) }
  let(:student) do
    instance_double(Student,
                    name: 'John',
                    surname: 'Doe')
  end

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
      let(:student) { Student.new(name: 'John', surname: 'Doe') }

      it 'returns an object of class Homework' do
        homework = obj.add_homework(title: 'HW03', description: 'OOP in Ruby', student: student)

        expect(homework).to be_an_instance_of(Homework)
      end
    end
  end
end
