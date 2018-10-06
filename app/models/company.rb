class Company < ApplicationRecord
  has_many :users
  has_many :payments

  def total_sales
    self.payments.reduce(0) { |sum, payment| sum+payment.amount }
  end

  def total_payable_amount
    total_sales * COMMISSION
  end
end
