# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper.rb'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/mentor.rb'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/student.rb'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/homework.rb'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/notification.rb'

RSpec.describe Mentor do
  mentor = described_class.new(name: 'mentor_name', surname: 'mentor_surname')

  let(:student) {Student.new(name: 'student_name', surname: 'student_surname')}
  let(:homework) {Homework.new('title', 'description', 'student', 'mentor')}
  let(:notification) {Notification.new('notification1')}

  context 'when creating an object of Mentor class' do

    it 'returns mentor object' do
      expect(described_class.new(name: 'Petya', surname: 'Ivanov')).to be_instance_of(Mentor)
    end

    it 'returns mentor object surname' do
      expect(mentor.surname).to eq('mentor_surname')
    end
  end

  context 'when mentor adds a homework' do

    it 'returns homework' do
      expect(mentor.add_homework(title: "homework_name", description: "homework_description", student: student)).to be_instance_of(Homework)
    end
  end

  context 'when mentor subscribes to student' do
    
    it 'returns list of mentor subscriptions' do
      expect(mentor.subscribe_to!(student)).to eq student.notification_list
    end
  end
  

  
end
