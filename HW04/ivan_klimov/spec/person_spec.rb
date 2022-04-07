# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/person'

RSpec.describe Person do
  describe '.new' do
    it 'sets the name' do
      person = described_class.new(name: 'Ked', surname: '500')
      expect(person.name).to eq 'Ked'
    end

    it 'sets the surname' do
      person = described_class.new(name: 'Ked', surname: '500')
      expect(person.surname).not_to eq ''
    end
  end
end
