# frozen_string_literal: true

RSpec.shared_examples 'update' do
  describe '#update' do
    let(:student) { Student.new(name: 'Petr', surname: 'Petrov') }
    let(:homework) { Homework.new(title: 'title', description: 'fake', student: student) }
    let(:user) { described_class.new(name: 'name', surname: 'surname') }

    before do
      allow(user).to receive(:add_notification)
    end

    it 'wait #add_notification with arguments' do
      user.update(homework)
      expect(user).to have_received(:add_notification)
    end
  end
end
