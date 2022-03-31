# frozen_string_literal: true

module PrintNotify
  def print_notify_for_student(noti)
    print_hw(noti) if noti.type == 'hw'
    print_rw(noti) if noti.type == 'rw'
    print_aw(noti) if noti.type == 'aw'
  end

  def print_hw(noti)
    puts "Mentor #{noti.person.name} #{noti.person.surname} added new homework: #{noti.title}, " \
          "description: #{noti.description}"
  end

  def print_rw(noti)
    puts "Mentor #{noti.person.name} #{noti.person.surname} reject homework: #{noti.title}, " \
          "description: #{noti.description}, your answer: #{noti.answer}"
  end

  def print_aw(noti)
    puts "Mentor #{noti.person.name} #{noti.person.surname} accept homework: #{noti.title}, " \
          "description: #{noti.description}, your answer: #{noti.answer}"
  end

  def print_notify_for_mentor(noti)
    print_tw(noti) if noti.type == 'tw'
    print_tc(noti) if noti.type == 'tc'
  end

  def print_tw(noti)
    puts "Student #{noti.person.name} #{noti.person.surname} started homework: #{noti.title}, " \
          "description: #{noti.description}"
  end

  def print_tc(noti)
    puts "Student #{noti.person.name} #{noti.person.surname} add answer to homework: #{noti.title}, " \
          "description: #{noti.description}, answer: #{noti.answer}"
  end

  def print_not_start(homew)
    puts "Not started > Title: #{homew.title}, description: #{homew.description}"
  end

  def print_start(homew)
    puts "Started > Title: #{homew.title}, description: #{homew.description}"
  end

  def print_ready(homew)
    puts "Ready > Title: #{homew.title}, description: #{h.description}"
  end
end
