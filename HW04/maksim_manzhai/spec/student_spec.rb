# frozen_string_literal: true

require 'student'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'Chris', surname: 'Rock') }

  context 'when student created' do
    it 'returns name' do
      expect(student.name).to eql 'Chris'
    end

    it 'returns surname' do
      expect(student.surname).to eql 'Rock'
    end
  end
end
