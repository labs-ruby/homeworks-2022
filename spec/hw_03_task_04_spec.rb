# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'

if File.exist?('HW03')
  Dir.chdir('HW03')
  Dir.glob('*').select do |f|
    next unless File.directory? f

    self.class.send(:remove_const, 'Homework3') if self.class.const_defined?('Homework3')
    Dir["#{f}/*.rb"].each do |file|
      load file
      puts file
    end

    RSpec.describe "Homework3: #{f}, Object ID: #{Homework3.object_id}" do
      let(:obj) { described_class.new }

      describe 'counter of letters and digits in the string' do
        context 'when word consists letters and digits' do
          it 'returns number of letters and digits' do
            expect(obj.task4('12345qwert')).to eq({ digits: 5, letters: 5 })
          end
        end

        context 'when word consists letters,symbols and digits' do
          it 'returns number of letters and digits' do
            expect(obj.task4('123_45q-+./,wert')).to eq({ digits: 5, letters: 5 })
          end
        end

        context 'when word is empty' do
          it 'returns number of letters=0 and digits=0' do
            expect(obj.task4('')).to eq({ digits: 0, letters: 0 })
          end
        end

        context 'when no arguments is given' do
          it 'returns ArgumentError' do
            expect { obj.task4 }.to raise_error(ArgumentError)
          end
        end
      end
    end
  end
end
