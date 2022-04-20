# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'TestName', surname: 'TestSurname') }
  let(:mentor) { Mentor.new(name: 'Test', surname: 'Testov') }
  let(:notification) { Notification.new(title: 'TestTitle', description: 'TestDescription') }
  let(:homework) do
    Homework.new(title: 'TestTitle',
                 description: 'TestDescription',
                 student: student,
                 mentor: mentor)
  end

  describe '#notify_mentor' do
    context 'when arguments are valid' do
      it 'changes notification list of mentor' do
        student.notify_mentor(mentor, 'TestDescription')
        expect(mentor.notifications_list).to include(an_object_having_attributes(description: 'TestDescription'))
      end
    end

    context 'when no arguments are given' do
      it 'raises ArgumentError' do
        expect { student.notify_mentor }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when notification is unread' do
      before { student.notifications_list.push(notification) }

      it 'makes notification as read' do
        student.mark_as_read!
        expect(student.notifications_list).to all(have_attributes(status: 'read'))
      end
    end

    context 'when notification is read' do
      before do
        notification.status = 'read'
        student.notifications_list.push(notification)
      end

      it 'does not change notification list of student' do
        expect { student.mark_as_read! }.not_to change(student, :notifications_list)
      end
    end
  end

  describe '#to_work!' do
    subject { student.to_work!(homework) }

    context 'when no argument is given' do
      it 'raises ArgumentError' do
        expect { student.to_work! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list).from([]).to([Notification])
      end
    end
  end

  describe '#add_answer!' do
    subject { student.add_answer!(homework, 'TestAnswer') }

    context 'when no argument is given' do
      it 'raises ArgumentError' do
        expect { student.add_answer! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes homework answer' do
        expect { subject }.to change(homework, :answer).from(nil).to('TestAnswer')
      end

      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list).from([]).to([Notification])
      end
    end
  end

  describe '#to_check!' do
    subject { student.to_check!(homework) }

    context 'when no argument is given' do
      it 'raises ArgumentError' do
        expect { student.to_check! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list).from([]).to([Notification])
      end
    end
  end

  describe '#homeworks' do
    subject { student.homeworks }

    context 'when student has homework' do
      before { student.homeworks_list.push(homework) }

      it 'prints current homework' do
        expect { subject }.to output("Homework #{homework.title}: #{homework.description}\n").to_stdout
      end
    end

    context 'when a homework list of student is empty' do
      it 'prints nothing' do
        expect { subject }.to output('').to_stdout
      end
    end
  end

  describe '#notifications' do
    subject { student.notifications }

    let(:expectation) { "0 notification to read\n" }

    context 'when student has 0 notification' do
      it 'prints info message' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when student has a read notification' do
      before do
        notification.status = 'read'
        student.notifications_list.push(notification)
      end

      it 'prints info message' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when student has an unread notification' do
      before { student.notifications_list.push(notification) }

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
  end
end
