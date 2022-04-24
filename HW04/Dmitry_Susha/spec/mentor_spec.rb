# frozen_string_literal: true

RSpec.describe Mentor do
  subject { described_class.new(name: 'Ivan', surname: 'Ivanov') }

  let(:student) { Student.new(name: 'Petr', surname: 'Petrov') }
  let(:homework) { Homework.new(title: 'title', description: 'fake', student: student) }

  describe '#add_homework' do
    before do
      allow(Homework).to receive(:new).with(
        title: 'title',
        description: 'fake',
        student: student
      ).and_return('homework')
    end

    it 'create new homework' do
      expect(subject.add_homework(title: 'title', description: 'fake', student: student)).to eq('homework')
    end

    it 'call Homework.new call' do
      subject.add_homework(title: 'title', description: 'fake', student: student)
      expect(Homework).to have_received(:new).with(title: 'title', description: 'fake', student: student)
    end
  end

  describe '#invite_student_to_work' do
    let(:mentor) { instance_double(described_class) }

    before do
      allow(mentor).to receive(:add_notification).with(homework.student)
      allow(mentor).to receive(:invite_student_to_work).with(homework).and_return(mentor.add_notification(homework.student))
    end

    it 'call #add_notification' do
      mentor.invite_student_to_work(homework)
      expect(mentor).to have_received(:add_notification).with(homework.student)
    end
  end

  describe '#subscribe_to' do
    before do
      allow(homework).to receive(:add_mentor_observer)
    end

    it 'call homework.add_mentor_observer' do
      subject.subscribe_to!(homework)
      expect(homework).to have_received(:add_mentor_observer)
    end
  end

  describe '#reject_to_work!' do
    context "with remarks = 'bad'" do
      before do
        allow(homework).to receive(:reject!).with(subject, 'bad')
      end

      it 'call homework.reject!' do
        subject.reject_to_work!(homework, 'bad')
        expect(homework).to have_received(:reject!).with(subject, 'bad')
      end
    end

    context 'without remarks' do
      before do
        allow(homework).to receive(:reject!).with(subject, '')
      end

      it 'call homework.reject!' do
        subject.reject_to_work!(homework)
        expect(homework).to have_received(:reject!).with(subject, '')
      end
    end
  end

  describe '#accept!' do
    context 'with default grade' do
      before do
        allow(homework).to receive(:accept!).with(5)
      end

      it 'call homework.reject!' do
        subject.accept!(homework)
        expect(homework).to have_received(:accept!).with(5)
      end
    end

    context 'with grade = 4' do
      before do
        allow(homework).to receive(:accept!).with(4)
      end

      it 'call homework.reject!' do
        subject.accept!(homework, 4)
        expect(homework).to have_received(:accept!).with(4)
      end
    end
  end

  describe '#update' do
    include_examples 'update'
  end
end
