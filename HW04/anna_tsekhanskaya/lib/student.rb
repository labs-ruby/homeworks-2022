# frozen_string_literal: true

require 'time'

class Student

    atter_accessor :firstname, :lastname
    atter_reader :noties
    def initialize
        @firstname = firstname
        @lastname = lastname
        @answer = []
        @noties_for_mentor = []
    end
    
    # student see notification about new homework
    def notifications
        Homework.noties
    end

    # student take to work homework
    
    def homeworks
        answer << homework
    end


    # student mark as read all notifications
    def mark_as_read
        noties_for_mentor << "#{firstname.capitalize} #{lastname.capitalize} read at #{Time.now}"
    end

    def to_work(homework)
        noties_for_mentor << "#{firstname.capitalize} #{lastname.capitalize} work at #{Time.now}"
        answer << homework

    end

    def add_answer(homework, str)
        return '0' if str.class != String)

        noties_for_mentor << str
        noties_for_mentor << "#{firstname.capitalize} #{lastname.capitalize} add answer at #{Time.now}"
        answer << homework
    end

    def to_check
        noties_for_mentor << "#{firstname.capitalize} #{lastname.capitalize} ready for chek at #{Time.now}"
    end

end
