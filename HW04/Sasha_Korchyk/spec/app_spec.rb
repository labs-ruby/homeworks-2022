# frozen_string_literal: true

require './app'
describe 'All classes' do
  describe Student do
    let(:student) { described_class.new(name: 'John', surname: 'Doe') }
    let(:mentor) { Mentor.new(name: 'Jack', surname: 'Gonsales') }

    describe 'attributes' do
      it 'allow reading :name' do
        expect(student.name).to eq('John')
      end

      it 'allow reading :surname' do
        expect(student.surname).to eq('Doe')
      end

      it 'allow reading and writing for :all_notifications' do
        student.all_notifications << 'Test'
        expect(student.all_notifications).to eq(['Test'])
      end

      it 'allow reading and writing for :all_homeworks' do
        student.all_homeworks << 'Test'
        expect(student.all_homeworks).to eq(['Test'])
      end
    end

    describe '#notifications' do
      context 'when student has not marked as read the notification yet' do
        it 'prints notification' do
          student.all_notifications << Notification.new('HW03', 'description homework', 'hw', mentor)
          out_put = "Mentor Jack Gonsales added new homework: HW03, description: description homework\n"
          expect { student.notifications }.to output(out_put).to_stdout
        end
      end

      context 'when student has marked as read the notification' do
        it 'does not print' do
          student.all_notifications << Notification.new('HW03', 'description homework', 'hw', mentor)
          student.mark_as_read!
          out_put = "Mentor Jack Gonsales added new homework: HW03, description: description homework\n"
          expect { student.notifications }.not_to output(out_put).to_stdout
        end
      end
    end

    describe '#mark_as_read!' do
      it "changes the key \'seen\' to true" do
        student.all_notifications << Notification.new('HW03', 'description homework', 'hw', mentor)
        expect { student.mark_as_read! }.to change { student.all_notifications[0].seen }.from(false).to(true)
      end
    end

    describe '#homeworks' do
      let(:out_put) { "Started > Title: HW03, description: description homework first\nNot started > Title: HW03, description: description homework second\n" }

      it 'prints all homeworks that mentor added' do
        student.all_homeworks << Homework.new('HW03', 'description homework first', student, mentor)
        student.all_homeworks << Homework.new('HW03', 'description homework second', student, mentor)
        student.all_homeworks[0].started_execution = true

        expect { student.homeworks }.to output(out_put).to_stdout
      end
    end

    describe '#to_work!' do
      let(:homework) { Homework.new('HW03', 'description homework', student, mentor) }

      it 'takes homework to work' do
        student.all_homeworks << homework
        expect { student.to_work!(homework) }.to change { student.all_homeworks[0].started_execution }.from(false).to(true)
      end

      it 'adds notification to mentor' do
        expect { student.to_work!(homework) }.to change { mentor.all_notifications.length }.by(1)
      end
    end

    describe '#add_answer!' do
      let(:homework) { Homework.new('HW03', 'description homework', student, mentor) }
      let(:answer) { 'my answer for homework' }

      it 'adds the answer to the task' do
        student.add_answer!(homework, answer)
        expect(homework.answer).to eq(answer)
      end
    end

    describe '#to_check!' do
      let(:homework) { Homework.new('HW03', 'description homework', student, mentor) }

      it 'adds notification to mentor about homework to check' do
        expect { student.to_check!(homework) }.to change { mentor.all_notifications.length }.by(1)
      end
    end
  end

  describe Mentor do
    let(:student) { Student.new(name: 'John', surname: 'Doe') }
    let(:mentor) { described_class.new(name: 'Jack', surname: 'Gonsales') }

    describe 'attributes' do
      it 'allow reading :name' do
        expect(mentor.name).to eq('Jack')
      end

      it 'allow reading :surname' do
        expect(mentor.surname).to eq('Gonsales')
      end

      it 'allow reading :subscribe' do
        expect(mentor.subscribe).to eq([])
      end

      it 'allow reading :all_notifications' do
        expect(mentor.all_notifications).to eq([])
      end
    end

    describe '#add_homework' do
      let(:add_work) { mentor.add_homework(title: 'HW03', description: 'description homework', student: student) }

      it 'creates and adds homework to student' do
        expect(add_work).to eq(student.all_homeworks[0])
      end

      it 'sends notification to student about new homework' do
        expect { add_work }.to change { student.all_notifications.length }.by(1)
      end
    end

    describe '#subscribe_to!' do
      it 'subscribes mentor to student' do
        mentor.subscribe_to!(student)
        expect(mentor.subscribe[0]).to eq(student)
      end
    end

    describe '#notifications' do
      context 'when mentor has not marked as read the notification' do
        let(:answer) { 'This is my answer for work' }
        let(:out_put) { "Student John Doe add answer to homework: HW03, description: description first, answer: This is my answer for work\nStudent John Doe started homework: HW03, description: description second\n" }

        it 'prints notification' do
          mentor.all_notifications << Notification.new('HW03', 'description first', 'tc', student, answer)
          mentor.all_notifications << Notification.new('HW03', 'description second', 'tw', student)
          expect { mentor.notifications }.to output(out_put).to_stdout
        end
      end

      context 'when mentor has marked as read the notification' do
        let(:out_put) { "Student John Doe started homework: HW03, description: description second\n" }

        it 'does not print notification' do
          mentor.all_notifications << Notification.new('HW03', 'description second', 'tw', student)
          mentor.mark_as_read!
          expect { mentor.notifications }.not_to output(out_put).to_stdout
        end
      end
    end

    describe '#mark_as_read!' do
      it "changes the key \'seen\' to true" do
        mentor.all_notifications << Notification.new('HW03', 'description homework', 'hw', mentor)
        expect { mentor.mark_as_read! }.to change { mentor.all_notifications[0].seen }.from(false).to(true)
      end
    end

    describe '#reject_to_work!' do
      let(:homework) { Homework.new('HW03', 'description homework', student, mentor) }

      it 'adds notification to student about rejected homework' do
        expect { mentor.reject_to_work!(homework) }.to change { student.all_notifications.length }.by(1)
      end
    end

    describe '#accept!' do
      let(:homework) { Homework.new('HW03', 'description homework', student, mentor) }

      it 'takes homework to work' do
        student.all_homeworks << homework
        expect { mentor.accept!(homework) }.to change { student.all_homeworks[0].accepted_by_mentor }.from(false).to(true)
      end

      it 'adds notification to student' do
        expect { mentor.accept!(homework) }.to change { student.all_notifications.length }.by(1)
      end
    end
  end

  describe Homework do
    let(:student) { Student.new(name: 'John', surname: 'Doe') }
    let(:mentor) { Mentor.new(name: 'Jack', surname: 'Gonsales') }
    let(:homework) { described_class.new('HW03', 'description homework', student, mentor) }

    describe 'attributes' do
      it 'allow reading :title' do
        expect(homework.title).to eq('HW03')
      end

      it 'allow reading :description' do
        expect(homework.description).to eq('description homework')
      end

      it 'allow reading :student' do
        expect(homework.student).to eq(student)
      end

      it 'allow reading :mentor' do
        expect(homework.mentor).to eq(mentor)
      end

      it 'allow reading and writing for :answer' do
        homework.answer = 'Test'
        expect(homework.answer).to eq('Test')
      end

      it 'allow reading and writing for :accepted_by_mentor' do
        homework.accepted_by_mentor = true
        expect(homework.accepted_by_mentor).to eq(true)
      end

      it 'allow reading and writing for :started_execution' do
        homework.started_execution = true
        expect(homework.started_execution).to eq(true)
      end
    end

    describe '#notify_add_homework' do
      it 'adds notification to student' do
        expect { homework.notify_add_homework }.to change { student.all_notifications.length }.by(1)
      end

      it 'adds homework to student' do
        homework.notify_add_homework
        expect(homework).to eq(student.all_homeworks[0])
      end
    end

    describe '#notify_take_to_work' do
      it 'adds notification to mentor' do
        expect { homework.notify_take_to_work }.to change { mentor.all_notifications.length }.by(1)
      end
    end

    describe '#notify_to_check' do
      it 'adds notification to mentor' do
        expect { homework.notify_to_check }.to change { mentor.all_notifications.length }.by(1)
      end
    end

    describe '#notify_reject_to_work' do
      it 'adds notification to student' do
        expect { homework.notify_reject_to_work }.to change { student.all_notifications.length }.by(1)
      end
    end

    describe '#notify_accept' do
      it 'adds notification to student' do
        expect { homework.notify_accept }.to change { student.all_notifications.length }.by(1)
      end
    end
  end

  describe Notification do
    let(:student) { Student.new(name: 'John', surname: 'Doe') }
    let(:notification) { described_class.new('HW03', 'description homework', 'tw', student, 'my answer') }

    describe 'attributes' do
      it 'allow reading :title' do
        expect(notification.title).to eq('HW03')
      end

      it 'allow reading :description' do
        expect(notification.description).to eq('description homework')
      end

      it 'allow reading :type' do
        expect(notification.type).to eq('tw')
      end

      it 'allow reading :person' do
        expect(notification.person).to eq(student)
      end

      it 'allow reading :answer' do
        expect(notification.answer).to eq('my answer')
      end

      it 'allow reading and writing for :seen' do
        notification.seen = true
        expect(notification.seen).to eq(true)
      end
    end
  end

  describe 'PrintNotify' do
    include PrintNotify

    let(:student) { Student.new(name: 'John', surname: 'Doe') }
    let(:mentor) { Mentor.new(name: 'Jack', surname: 'Gonsales') }
    let(:homework) { Homework.new('HW03', 'description homework', student, mentor) }

    describe '#print_notify_for_student' do
      let(:notification) { Notification.new('HW03', 'description homework', 'rw', mentor, 'my answer') }
      let(:out_put) { "Mentor Jack Gonsales reject homework: HW03, description: description homework, your answer: my answer\n" }

      it 'prints notification for student' do
        expect { print_notify_for_student(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_hw' do
      let(:notification) { Notification.new('HW03', 'description homework', 'hw', mentor) }
      let(:out_put) { "Mentor Jack Gonsales added new homework: HW03, description: description homework\n" }

      it 'prints notification for student about new homework' do
        expect { print_hw(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_rw' do
      let(:notification) { Notification.new('HW03', 'description homework', 'rw', mentor, 'my answer') }
      let(:out_put) { "Mentor Jack Gonsales reject homework: HW03, description: description homework, your answer: my answer\n" }

      it 'prints notification for student about reject homework' do
        expect { print_rw(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_aw' do
      let(:notification) { Notification.new('HW03', 'description homework', 'aw', mentor, 'my answer') }
      let(:out_put) { "Mentor Jack Gonsales accept homework: HW03, description: description homework, your answer: my answer\n" }

      it 'prints notification for student about accept homework' do
        expect { print_aw(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_notify_for_mentor' do
      let(:notification) { Notification.new('HW03', 'description homework', 'tw', student) }
      let(:out_put) { "Student John Doe started homework: HW03, description: description homework\n" }

      it 'prints notification for mentor about student started homework' do
        expect { print_notify_for_mentor(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_tw' do
      let(:notification) { Notification.new('HW03', 'description homework', 'tw', student) }
      let(:out_put) { "Student John Doe started homework: HW03, description: description homework\n" }

      it 'prints notification for mentor student started homework' do
        expect { print_tw(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_tc' do
      let(:notification) { Notification.new('HW03', 'description homework', 'tw', student, 'my answer') }
      let(:out_put) { "Student John Doe add answer to homework: HW03, description: description homework, answer: my answer\n" }

      it 'prints notification for mentor about student add answer to homework' do
        expect { print_tc(notification) }.to output(out_put).to_stdout
      end
    end

    describe '#print_not_start' do
      let(:out_put) { "Not started > Title: HW03, description: description homework\n" }

      it 'prints homework that not started for student' do
        expect { print_not_start(homework) }.to output(out_put).to_stdout
      end
    end

    describe '#print_start' do
      let(:out_put) { "Started > Title: HW03, description: description homework\n" }

      it 'prints homework that started for student' do
        expect { print_start(homework) }.to output(out_put).to_stdout
      end
    end

    describe '#print_ready' do
      let(:out_put) { "Ready > Title: HW03, description: description homework\n" }

      it 'prints homework that redy for student' do
        expect { print_ready(homework) }.to output(out_put).to_stdout
      end
    end
  end
end
