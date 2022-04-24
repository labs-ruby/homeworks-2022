# frozen_string_literal: true

RSpec.describe User do
  subject { described_class.new(name: 'Ivan', surname: 'Ivanov') }

  describe '#name' do
    it 'user has name' do
      expect(subject.name).to eq('Ivan')
    end
  end

  describe '#surname' do
    it 'user has surname' do
      expect(subject.surname).to eq('Ivanov')
    end
  end
end
