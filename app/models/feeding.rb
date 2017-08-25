# frozen-string-literal: true

class Feeding < ApplicationRecord
  validates :start_time, presence: true
  validates :left_breast, presence: true
  validates :right_breast, presence: true
  validates :amount, presence: true
  validates :formula, inclusion: { in: [true, false] }
  validates :milk, inclusion: { in: [true, false] }

  validate :must_have_formula_or_milk

  scope :last_24, -> { where('start_time >= ?', 24.hours.ago) }

  private

  def must_have_formula_or_milk
    errors.add(:base, 'Must have one or both of Formula or Milk') unless formula || milk
  end
end
