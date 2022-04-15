# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'TestName', surname: 'TestSurname') }
  let(:mentor) { described_class.new(name: 'Test', surname: 'Testov') }
  let(:notification) { Notification.new(title: 'TestTitle', description: 'TestDescription') }
  let(:homework) do
    Homework.new(title: 'TestTitle',
                 description: 'TestDescription',
                 student: student,
                 mentor: mentor)
  end

  describe '#notify_student' do
    context 'when no arguments are given' do
      it 'raises ArgumentError' do
        expect { mentor.notify_student }.to raise_error(ArgumentError)
      end
    end

    context 'when arguments are valid' do
      it 'changes notification list of student' do
        mentor.notify_student(student, 'TestDescription')
        expect(student.notifications_list).to include(an_object_having_attributes(description: 'TestDescription'))
      end
    end
  end

  describe '#add_homework' do
    subject { mentor.add_homework(title: 'HW04', description: 'Task#1', student: student) }

    context 'when arguments are valid' do
      it 'creates a new notification to student' do
        expect { subject }.to change(student, :notifications_list).from([]).to([Notification])
      end

      it('returns a new homework') { is_expected.to be_kind_of(Homework) }
    end

    context 'when no arguments are given' do
      it 'raises ArgumentError' do
        expect { mentor.add_homework }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when notification is unread' do
      before { mentor.notifications_list.push(notification) }

      it 'makes notification as read' do
        mentor.mark_as_read!
        expect(mentor.notifications_list).to all(have_attributes(status: 'read'))
      end
    end

    context 'when notification is read' do
      before do
        notification.status = 'read'
        mentor.notifications_list.push(notification)
      end

      it 'does not change notification list of mentor' do
        expect { mentor.mark_as_read! }.not_to change(mentor, :notifications_list)
      end
    end
  end

  describe '#reject_to_work!' do
    subject { mentor.reject_to_work!(homework) }

    context 'when no argument is given' do
      it 'raises ArgumentError' do
        expect { mentor.reject_to_work! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes notification list of student' do
        expect { subject }.to change(student, :notifications_list).from([]).to([Notification])
      end
    end
  end

  describe '#accept!' do
    subject { mentor.accept!(homework) }

    context 'when no argument is given' do
      it 'raises ArgumentError' do
        expect { mentor.accept! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes notification list of student' do
        expect { subject }.to change(student, :notifications_list).from([]).to([Notification])
      end

      it 'changes the status of homework' do
        expect { subject }.to change(homework, :accepted).from(false).to(true)
      end
    end
  end

  describe '#notifications' do
    subject { mentor.notifications }

    let(:expectation) { "0 notification to read\n" }

    context 'when notification list of mentor is empty' do
      it 'prints a message about no notifications' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when mentor has an unread notification' do
      before { mentor.notifications_list.push(notification) }

      let(:expectation) do
        <<~OUT
          New notification:
           #{notification.title}, #{notification.description}
        OUT
      end

      it 'prints unread notification' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when mentor has a read notification' do
      before do
        notification.status = 'read'
        mentor.notifications_list.push(notification)
      end

      it 'prints a message about no notifications' do
        expect { subject }.to output(expectation).to_stdout
      end
    end
  end
end
