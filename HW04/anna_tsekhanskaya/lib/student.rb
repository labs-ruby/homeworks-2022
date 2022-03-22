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
    end


    # student mark as read all notifications
    def mark_as_read
        noties_for_mentor << "Read at #{Time.now}"
    end

    def to_work
        noties_for_mentor << "Working at #{Time.now}"

    end

    def add_answer(homework, str)
        return '0' if str.class != String)
        answer << str
        noties_for_mentor << "Add answer at #{Time.now}"
    end

    def to_check
        noties_for_mentor << "Ready for chek at #{Time.now}"
    end

end



# student can see homeworks
student.homeworks
# student add answer to homework
student.add_answer!(homework, 'new students answer')
# student sent to check homework
student.to_check!(homework)

# ---
student.add_answer!(homework, 'new students answer_after reject')
student.to_check!(homework)
# ---

# student see notification about homework was accept
student.notifications