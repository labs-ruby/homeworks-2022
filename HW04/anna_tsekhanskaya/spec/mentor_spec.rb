# frozen_string_literal: true

require_relative '../lib/mentor'

RSpec.describe Mentor do
  mentor { described_class.new(name: 'Boris', surname: 'Tsarikov') }

  describe '#name' do
    it 'mentor has name' do
      expect(mentor.name).to eq('Boris')
    end
  end

  describe '#surname' do
    it 'mentor has surname' do
      expect(mentor.surname).to eq('Tsarikov')
    end
  end

  describe '#full_name' do
    mentor.full_name
    it 'mentor has fullname' do
      expected_mentor = 'Boris Tsarikov'
      expect(mentor).to eq expected_mentor
    end
  end
end
