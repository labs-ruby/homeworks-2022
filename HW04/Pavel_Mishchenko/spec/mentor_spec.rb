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
    context 'when no arguments given' do
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

    context 'when no arguments given' do
      it 'raises ArgumentError' do
        expect { mentor.add_homework }.to raise_error(ArgumentError)
      end
    end

    context 'when student is not Student.class instance' do
      let(:student) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when notifiications is unread' do
      before { mentor.notifications_list.push(notification) }

      it 'makes all notifictions as read' do
        mentor.mark_as_read!
        expect(mentor.notifications_list).to all(have_attributes(status: 'read'))
      end
    end

    context 'when notifiications is read' do
      before do
        notification.status = 'read'
        mentor.notifications_list.push(notification)
      end

      it "doesn't make any changes" do
        expect { mentor.mark_as_read! }.not_to change(mentor, :notifications_list)
      end
    end
  end

  describe '#reject_to_work!' do
    subject { mentor.reject_to_work!(homework) }

    context 'when no argument given' do
      it 'raises ArgumentError' do
        expect { mentor.reject_to_work! }.to raise_error(ArgumentError)
      end
    end

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
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

    context 'when no argument given' do
      it 'raises ArgumentError' do
        expect { mentor.accept! }.to raise_error(ArgumentError)
      end
    end

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context 'when argument is valid' do
      it 'notifies student' do
        expect { subject }.to change(student, :notifications_list).from([]).to([Notification])
      end

      it 'changes homework accepted status' do
        expect { subject }.to change(homework, :accepted).from(false).to(true)
      end
    end
  end

  describe '#notifications' do
    subject { mentor.notifications }

    context 'when mentor has only unread notifications' do
      before { mentor.notifications_list.push(notification) }

      let(:expectation) do
        <<~OUT
          New notification:
           #{notification.title}, #{notification.description}
        OUT
      end

      it 'prints unread notifications' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when mentor has only read notification' do
      before do
        notification.status = 'read'
        mentor.notifications_list.push(notification)
      end

      let(:expectation) { "0 notification to read\n" }

      it 'prints info message' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when mentor has 0 notifications' do
      let(:expectation) { "0 notification to read\n" }

      it 'prints info message' do
        expect { subject }.to output(expectation).to_stdout
      end
    end
  end
end
