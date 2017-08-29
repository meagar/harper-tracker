class Pumping < ApplicationRecord
  validates :left, :right, :pump_time, presence: true

  default_scope -> { order(pump_time: :desc) }

  def total
    left + right
  end
end
