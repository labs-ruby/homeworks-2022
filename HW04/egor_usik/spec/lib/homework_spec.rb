# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe Homework do
  subject(:create) { described_class.new('HW04', 'HW04 desc') }

  describe '#initialize' do
    context 'when creates the status is NEW' do
      it 'returns a status NEW' do
        expect(create.status).to eq(HomeworkStatuses::NEW)
      end
    end

    context 'when creates there are no answers' do
      it 'returns an empty array answers' do
        expect(create.answers).to eq([])
      end
    end

    context 'when arguments are not given' do
      let(:homework_with_no_args) { described_class.new }

      it 'returns an argument error' do
        expect { homework_with_no_args }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#add_answer' do
    context 'when adds an answer' do
      it 'adds an answer' do
        expect { create.add_answer('Answer') }.to change { create.answers.count }.by(1)
      end
    end
  end

  describe '#mark_as' do
    context 'when marks as executing, done' do
      example 'returns value of the status EXECUTING (1)' do
        expect(create.mark_as!(HomeworkStatuses::EXECUTING)).to eq(1)
      end

      example 'returns value of the status DONE (2)' do
        expect(create.mark_as!(HomeworkStatuses::DONE)).to eq(2)
      end
    end

    context 'when marks as done then as rejected' do
      it 'changes the status to DONE and then to REJECTED' do
        create.mark_as!(HomeworkStatuses::DONE).then do
          expect(create.mark_as!(HomeworkStatuses::REJECTED)).to eq(3)
        end
      end
    end

    context 'when marks as rejected the homework is executing' do
      it 'returns an error' do
        create.mark_as!(HomeworkStatuses::EXECUTING).then do
          expect { create.mark_as!(HomeworkStatuses::REJECTED) }.to raise_error(StandardError)
        end
      end
    end

    context 'when marks as rejected after the homework was accepted' do
      it 'returns an error' do
        create.mark_as!(HomeworkStatuses::ACCEPTED).then do
          expect { create.mark_as!(HomeworkStatuses::REJECTED) }.to raise_error(StandardError)
        end
      end
    end

    context 'when marks as new the homework has a different status' do
      it 'returns an error' do
        create.mark_as!(HomeworkStatuses::EXECUTING).then do
          expect { create.mark_as!(HomeworkStatuses::NEW) }.to raise_error(StandardError)
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
