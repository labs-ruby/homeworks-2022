# frozen_string_literal: true

class Observer
  def initialize
    @customers = []
  end

  def homework_was_added
    @customers.find(customer).notify('Homework was added')
  end

  def answer_for_homework_was_added(answer)
    @customers.find(customer).notify("The answer '#{answer}' was added.")
  end

  def add_customer(customer)
    @customers << customer
  end
end
