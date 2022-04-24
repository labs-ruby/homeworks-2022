# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/student'
require_relative '../lib/mentor'
require_relative 'spec_helper'

RSpec.describe Homework do
  let(:title) { 'HW03' }
  let(:description) { 'description homework' }
  let(:student) { Student.new(name: 'John', surname: 'Doe') }
  let(:mentor) { Mentor.new(name: 'Jack', surname: 'Gonsales') }

  let(:obj) { described_class.new(title, description, student, mentor, 'new') }

  describe 'checking fields of instance' do
    context 'when fields is correct' do
      it 'returns instance of Homework' do
        expect(obj).to be_an_instance_of(described_class)
      end

      it 'when title is correct' do
        expect(obj.title).to eq(title)
      end

      it 'when description is correct' do
        expect(obj.description).to eq(description)
      end

      it 'when student the same' do
        expect(obj.student).to eq(student)
      end

      it 'when mentor the same' do
        expect(obj.mentor).to eq(mentor)
      end
    end
  end
end
