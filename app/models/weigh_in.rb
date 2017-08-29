class WeighIn < ApplicationRecord
  validates :weight, :weigh_time, presence: true

  default_scope -> { order(weigh_time: :desc) }
end
