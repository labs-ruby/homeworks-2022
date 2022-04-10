# frozen_string_literal: true

require_relative '../lib/mentor'

RSpec.describe Mentor do
  subject(:mentor) { described_class.new(name: name, surname: surname) }

  let(:name) { 'Andrey' }
  let(:surname) { 'Abc' }

  describe '#notifications' do
    context 'when filename exist' do
      let(:filename) { 'notification.txt' }
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }

      it 'read filename and put text' do
        allow(File).to receive(:open).with(filename, 'r').and_return(file)
        expect { mentor.notifications }.to output.to_stdout
      end
    end
  end
end
