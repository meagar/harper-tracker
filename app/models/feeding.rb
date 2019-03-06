# frozen-string-literal: true

class Feeding < ApplicationRecord
  # Breast feeding is off the table, stub values in
  before_validation :populate_breasts

  validates :start_time, presence: true
  validates :left_breast, presence: true
  validates :right_breast, presence: true
  validates :amount, presence: true
  validates :formula, inclusion: { in: [true, false] }
  validates :milk, inclusion: { in: [true, false] }

  validate :must_have_formula_or_milk

  default_scope -> { order(start_time: :desc) }

  scope :last_24, -> { where('start_time >= ?', 24.hours.ago) }

  private

  def populate_breasts
    self.left_breast = self.right_breast = 0
  end

  def must_have_formula_or_milk
    errors.add(:base, 'Must have one or both of Formula or Milk') unless formula || milk
  end
end
