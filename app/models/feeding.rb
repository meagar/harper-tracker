# frozen-string-literal: true

class Feeding < ApplicationRecord
  validates :start_time, presence: true
  validates :amount, presence: true
  validates :formula, inclusion: { in: [true, false] }
  validates :milk, inclusion: { in: [true, false] }

  validate :must_have_formula_or_milk

  private

  def must_have_formula_or_milk
    errors.add(:base, 'Must have one or both of Formula or Milk') unless formula || milk
  end
end
