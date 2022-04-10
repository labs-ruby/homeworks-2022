# frozen_string_literal: true

RSpec.shared_examples 'update' do
  describe '#update' do
    let(:student) { Student.new(name: 'Petr', surname: 'Petrov') }
    let(:homework) { Homework.new(title: 'title', description: 'fake', student: student) }
    let(:user) { instance_double(described_class) }
    let(:notification_message) do
      "#{homework.student.name} #{homework.student.surname} #{homework.title} - #{homework.state}"
    end

    before do
      allow(user).to receive(:add_notification).with(user, notification_message)
      allow(user).to receive(:update).with(homework).and_return(user.add_notification(user, notification_message))
    end

    it 'wait #add_notification with arguments' do
      user.update(homework)
      expect(user).to have_received(:add_notification).with(user, notification_message)
    end
  end
end
