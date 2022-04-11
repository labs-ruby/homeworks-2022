# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'

RSpec.describe Homework do
  let(:student) { Student.new(name: 'Test', surname: 'Student') }
  let(:mentor) { Mentor.new(name: 'Test', surname: 'Mentor') }
  let(:homework) { described_class.new(title: 'Test title', description: 'Test description', student: student, mentor: mentor) }

  context 'when all parameters given' do
    it 'title transferred correct' do
      expect(homework.title).to eq 'Test title'
    end

    it 'description transferred correct' do
      expect(homework.description).to eq 'Test description'
    end

    it 'Student name and surname transferred correct' do
      expect(homework.student).to eq student
    end

    it 'Mentor name and surname transferred correct' do
      expect(homework.mentor).to eq mentor
    end

    it 'Status is Created by default' do
      expect(homework.status).to eq 'Created'
    end

    it 'Answers array is empty' do
      expect(homework.answers).to eq []
    end
  end
end
