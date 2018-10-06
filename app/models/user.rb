class User < ApplicationRecord
  enum role: [:user, :merchant, :admin]
  after_initialize :set_default_role, :if => :new_record?

  belongs_to :company, optional: true
  has_many :payments

  def set_default_role
    self.role ||= :user
  end

  def total_amount_spent
    sum = 0
    self.payments.each do |payment|
      sum += payment.amount
    end
    return sum
  end

  def last_payment_date
    self.payments.order(:created_at)&.last&.created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
